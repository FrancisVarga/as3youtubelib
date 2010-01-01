/*
	Adobe Systems Incorporated(r) Source Code License Agreement
	Copyright(c) 2005 Adobe Systems Incorporated. All rights reserved.
	
	Please read this Source Code License Agreement carefully before using
	the source code.
	
	Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive, 
	no-charge, royalty-free, irrevocable copyright license, to reproduce,
	prepare derivative works of, publicly display, publicly perform, and
	distribute this source code and such derivative works in source or 
	object code form without any attribution requirements.  
	
	The name "Adobe Systems Incorporated" must not be used to endorse or promote products
	derived from the source code without prior written permission.
	
	You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
	against any loss, damage, claims or lawsuits, including attorney's 
	fees that arise or result from your use or distribution of the source 
	code.
	
	THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT 
	ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
	BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  ALSO, THERE IS NO WARRANTY OF 
	NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT.  IN NO EVENT SHALL MACROMEDIA
	OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
	OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
	WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
	OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.adobe.webapis.youtube.methodgroups {
	
	import com.adobe.webapis.youtube.*;
	import com.adobe.webapis.youtube.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.xml.*;
	
	/**
	 * Contains helper functions for the method group classes that are
	 * reused throughout them.
	 */
	public class MethodGroupHelper
	{
		//need to hid this
		public static const PLAYER_PATH_PREFIX:String = "http://www.youtube.com/v/";
	
		/**
		 * Reusable method that the "method group" classes can call to invoke a
		 * method on the API.
		 *
		 * @param callBack The function to be notified when the RPC is complete
		 * @param method The name of the method to invoke ( like flickr.test.echo )
		 * @param signed A boolean value indicating if the method call needs
		 *			an api_sig attached to it
		 * @param params An array of NameValuePair or primitive elements to pass
		 *			as parameters to the remote method
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function invokeMethod( service:YouTubeService, callBack:Function, 
									method:String, ... params:Array ):void
		{
			
			// Create an array to store our name/value pairs
			// for the query because during signing we need to sort
			// these alphabetically
			var args:Array = new Array();
			
			args.push( new NameValuePair( "dev_id", service.apiKey ) );
			args.push( new NameValuePair( "method", method ) );
			
			
			// Loop over the params and add them as arguments
			for ( var i:int = 0; i < params.length; i++ )
			{
				// Do we have an argument name, or do we create one
				if ( params[i] is NameValuePair )
				{
					args.push( params[i] );
				} 
				else
				{
					// Create a unique argument name using our loop counter
					args.push( new NameValuePair( "param" + i, params[i].toString() ) );
				}
			}
			
			// Construct the query string to send to the Flickr service
			var query:String = "?";
			for ( var k:int = 0; k < args.length; k++ )
			{
				// This puts 1 too many "&" on the end, but that doesn't
				// affect the YouTube call, so it doesn't matter
				query += args[k].name + "=" + args[k].value + "&";
			}
			
			// Use the "internal" youtubeservice namespace to be able to
			// access the urlLoader so we can make the request.
			var loader:URLLoader = service.youtubeservice_internal::urlLoader;
			
			// Construct a url request with our query string and invoke
			// the Flickr method
			loader.addEventListener( "complete", callBack );
			loader.load( new URLRequest( YouTubeService.END_POINT + query ) );			
		}
		
		/**
		 * Handle processing the result of the API call.
		 *
		 * @param service The FlickrService associated with the method group
		 * @param response The XML response we got from the loader call
		 * @param result The event to fill in the details of and dispatch
		 * @param parseFunction The function to parse the response XML with
		 * @langversion ActionScript 3.0
		 * @playerversion Flash 8.5
		 * @tiptext
		 */
		internal static function processAndDispatch( service:YouTubeService,
													 data:String,
													 event:YouTubeServiceEvent, 
													 parseFunction:Function = null ):void
		{
			event.data = new Object();
			var x:XML = new XML( data );
			
			if ( x.@status == "ok" )
			{
				event.error = false;
				
				if ( parseFunction == null )
				{
					// No parse function speficied, just pass through the XML data.
					// Construct an object that we can access via E4X since
					// the result we get back is an xml response
					event.data.xml = x;
				}
				else
				{
					event.data = parseFunction( x );	
				}							
			}
			else
			{
				event.error = true;
				
				var error:YouTubeError = new YouTubeError();
				error.errorCode = Number(x.error.code);
				error.errorMessage = x.error.description;
				event.data.error = error;
			}

			// Notify everyone listening
			service.dispatchEvent( event );
		}

		public static function parseProfile( data:XML ):Object
		{
			var p:Profile = new Profile();
			var up:XMLList = data.user_profile;
			
			p.firstName = up.first_name;
			p.lastName = up.last_name;
			p.aboutMe = up.about_me;
			p.age = uint(up.age);
			p.videoUploadCount = uint(up.video_upload_count);
			p.videoWatchCount = uint(up.video_watch_count);
			p.homepage = up.homepage;
			p.hometown = up.hometown;
			p.gender = up.gender;
			p.occupations = up.occupations;
			p.companies = up.companies;
			p.city = up.city;
			p.country = up.country;
			p.books = up.books;
			p.hobbies = up.hobbies;
			p.movies = up.movies;
			p.relationship = up.relationship;
			p.friendCount = uint(up.friend_count);
			p.favoriteVideoCount = uint(up.favorite_video_count);
			p.currentlyOn = Boolean(up.currently_on);
			
			return { profile:p };
		}	
		
		public static function parseVideoList( data:XML ):Object
		{
			var videoList:Array = new Array();
			
			for each( var video:XML in data.video_list.video )
			{
				var v:Video = new Video();
				v.author = video.author;
				v.id = video.id;
				v.title = video.title;
				v.lengthSeconds = uint(video.length_seconds);
				v.ratingAvg = Number(video.rating_avg);
				v.ratingCount = uint(video.rating_count);
				v.description = video.description;
				v.viewCount = uint(video.view_count);
				
				var d:Date = new Date();
				d.setTime( Number(video.upload_time) );
				v.uploadTime = d;
				v..commentCount = uint(video.comment_count);
				v.tags = video.tags;
				v.url = video.url;
				v.thumbnailUrl = video.thumbnail_url;
				v.playerURL = MethodGroupHelper.PLAYER_PATH_PREFIX + v.id;
				videoList.push( v );
			}
			
			return { videoList:videoList };	
		}
		
		public static function parseFriendList( data:XML ):Object
		{	        
	        var friendList:Array = new Array();
	        
	        for each( var friend:XML in data.friend_list.friend )
	        {
	        	var f:Friend = new Friend();
	        	f.user = friend.user;
	        	f.videoUploadCount = uint(friend.video_upload_count);
	        	f.favoriteCount = uint(friend.favorite_count);
	        	f.friendCount = uint(friend.friend_count);
	        	friendList.push( f );
	        }
	        
	        return { friendList:friendList };
		}
		
		public static function parseVideoDetails( data:XML ):Object
		{
			var v:VideoDetails = new VideoDetails();
			var vd:XMLList = data.video_details;
			var d:Date;
			
			v.author = vd.author;
			v.title = vd.title;
			v.ratingAvg = Number(vd.rating_avg);
			v.ratingCount = uint(vd.rating_count);
			v.tags = vd.tags;
			v.description = vd.description;
			d = new Date();
			d.setTime( Number(vd.update_time) );
			v.updateTime = d;
			v.viewCount = uint(vd.view_count);
			d = new Date();
			d.setTime( Number(vd.upload_time) );
			v.uploadTime = d;
			v.lengthSeconds = vd.length_seconds;
			v.recordingDate = vd.recording_date;
			v.recordingLocation = vd.recording_location;
			v.recordingCountry = vd.recording_country;
			
			v.commentList = new Array();
			for each( var comment:XML in data.video_details.comment_list.comment )
	        {
	        	var time:Date = new Date();
	        	time.setTime( Number(comment.time) );
	        	v.commentList.push({
	        					  	author:String(comment.author),
	        					  	
	        					  	//temp hack to workaround b3 bug
	        					  	text:String(comment["text"]),
	        					  	time:time
	        					  });
			}
			
			v.channelList = new Array();
			for each( var channel:XML in data.video_details.channel_list.channel )
			{
				v.channelList.push( channel );
			}
			
			return { videoDetails:v };
		}
		
	}
	
}