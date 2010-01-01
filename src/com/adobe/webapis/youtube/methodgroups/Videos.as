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

package com.adobe.webapis.youtube.methodgroups
{
	import com.adobe.webapis.youtube.NameValuePair;
	import com.adobe.webapis.youtube.YouTubeService;
	import com.adobe.webapis.youtube.events.YouTubeServiceEvent;
	//import com.adobe.webapis.youtube.MethodGroupHelper;
	
	import flash.events.*;
	import flash.net.URLLoader;
	
	/**
	 * The Videos class contains methods for accessing the videos group of
	 * API calls for YouTube. An instance of this can be read from a YouTubeService
	 * instance.
	 */	
	public class Videos
	{
		private var service:YouTubeService;
	
		public function Videos( service:YouTubeService )
		{
			this.service = service;		
		}
		
		/**
		 * Lists all videos that have the specified tag.
		 * 
		 * @param tag The tag to search for.
		 */
		public function listByTag( tag:String ):void
		{
			MethodGroupHelper.invokeMethod( service, listByTag_result, "youtube.videos.list_by_tag", new NameValuePair("tag",tag) );
		}
		
		private function listByTag_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.VIDEOS_LIST_BY_TAG );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseVideoList );
		}
		
		/**
		 * Displays the details for a video.
		 * 
		 * @param videoId The ID of the video to get details for. This is the ID that's returned by the list
		 */
		public function getDetails( videoId:String ):void
		{
			MethodGroupHelper.invokeMethod( service, getDetails_result, "youtube.videos.get_details", new NameValuePair("video_id",videoId) );
		}
		
		private function getDetails_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.VIDEOS_GET_DETAILS );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseVideoDetails );
		}		
		
		/**
		 * Lists all videos that were uploaded by the specified user
		 * 
		 * @param user User whose videos you want to list.
		 */
		public function listByUser( user:String ):void
		{
			MethodGroupHelper.invokeMethod( service, listByUser_result, "youtube.videos.list_by_user", new NameValuePair("user",user) );
		}
		
		private function listByUser_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.VIDEOS_LIST_BY_USER );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseVideoList );
		}	
		
		/**
		 * Lists the most recent 25 videos that have been featured on the front page of the YouTube site.
		 */
		public function listFeatured():void
		{
			MethodGroupHelper.invokeMethod( service, listFeatured_result, "youtube.videos.list_featured" );
		}
		
		private function listFeatured_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.VIDEOS_LIST_FEATURED );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseVideoList );
		}					
	}
}