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

package com.adobe.webapis.youtube
{
	
	import com.adobe.webapis.youtube.youtubeservice_internal;
	
	import com.adobe.webapis.youtube.methodgroups.Users;
	import com.adobe.webapis.URLLoaderBase;
	
	import flash.net.URLLoader;
	import com.adobe.webapis.youtube.methodgroups.Videos;
	
	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Users.getProfile() being called.
	*
	* 	The event contains the following properties:		
	* 	data.profile The Profile for the specified user.
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.USERS_GET_PROFILE
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Users.getProfile
	* 	@see #com.adobe.webapis.youtube.Profile
	*/
	[Event(name="onGetProfile", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]		

	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Users.listFavoriteVideo() being called.
	*
	* 	The event contains the following properties:		
	* 	data.videoList An Array of Video ojects.
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.USERS_LIST_FAVORITE_VIDEOS
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Users.listFavoriteVideo
	* 	@see #com.adobe.webapis.youtube.Video
	*/
	[Event(name="onListFavoriteVideos", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]		
	
	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Users.listFriends() being called.
	*
	* 	The event contains the following properties:		
	* 	data.friendList An Array of Friend ojects.
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.USERS_LIST_FRIENDS
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Users.listFriends
	* 	@see #com.adobe.webapis.youtube.Friend
	*/
	[Event(name="onListFriends", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]		
	
	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Videos.getDetails() being called.
	*
	* 	The event contains the following properties:		
	* 	data.videoDetails A VideoDetail instance
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.VIDEOS_GET_DETAILS
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Videos.getDetails
	* 	@see #com.adobe.webapis.youtube.VideoDetails
	*/
	[Event(name="onGetDetails", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]	
	
	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Videos.listByUser() being called.
	*
	* 	The event contains the following properties:		
	* 	data.videoList An Array of Video ojects.
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.VIDEOS_LIST_BY_USER
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Videos.listByUser
	* 	@see #com.adobe.webapis.youtube.Video
	*/
	[Event(name="onListByUser", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]	
	
	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Videos.listByTag() being called.
	*
	* 	The event contains the following properties:		
	* 	data.videoList An Array of Video ojects.
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.VIDEOS_LIST_BY_TAG
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Videos.listByTag
	* 	@see #com.adobe.webapis.youtube.Video
	*/
	[Event(name="onListByTag", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]		
	
	/**
	* 	Broadcast when video information has been loaded from YouTube in response to
	* 	Videos.listFeatured() being called.
	*
	* 	The event contains the following properties:		
	* 	data.videoList An Array of Video ojects.
	*
	* 	@langversion ActionScript 3.0
	*	@playerversion Flash 8.5
	*	@tiptext
	*   
	*	@eventType com.adobe.webapis.youtube.events.YouTubeServiceEvent.VIDEOS_LIST_FEATURED
	* 
	* 	@see #com.adobe.webapis.youtube.methodgroups.Videos.listFeatured
	* 	@see #com.adobe.webapis.youtube.Video
	*/
	[Event(name="onListFeatured", 
		 type="com.adobe.webapis.youtube.events.YouTubeServiceEvent")]		
	
	/**
	 * The YouTubeService class abstracts all functionality for the YouTube
	 * API.  
	 */
	public class YouTubeService extends URLLoaderBase
	{
		/**
		 *	This is the end point for the service that we talk to.
		 */
		public static var END_POINT:String = "http://www.youtube.com/api2_rest";
		
		/**
		 * The developer API can be generated from your profile page on YouTube.com.
		 */
		public var apiKey:String = "";
		
		private var _users:Users;
		private var _videos:Videos;
		
		public function YouTubeService( apiKey:String = "" )
		{
			this.apiKey = apiKey;

			this._users = new Users( this );
			this._videos = new Videos( this );
		}
		
		public function get users():Users
		{
			return this._users;
		}
		
		public function get videos():Videos
		{
			return this._videos;
		}
		
		youtubeservice_internal function get urlLoader():URLLoader
		{
			return getURLLoader();	
		}
	}
}