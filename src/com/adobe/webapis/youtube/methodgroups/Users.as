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
	
	import flash.net.URLLoader;
	import flash.events.Event;
	
	/**
	 * The Users class contains methods for accessing the user group of
	 * API calls for YouTube. An instance of this can be read from a YouTubeService
	 * instance.
	 */
	public class Users
	{
		private var service:YouTubeService;
	
		public function Users( service:YouTubeService )
		{
			this.service = service;		
		}
		
		/**
		 * Retrieves the public parts of a user profile.
		 * 
		 * @param user The user to retrieve the profile for. This is the same as the name that shows up on the YouTube website.
		 */
		public function getProfile( user:String ):void
		{
			MethodGroupHelper.invokeMethod( service, getProfile_result, "youtube.users.get_profile", new NameValuePair("user",user) );
		}

		private function getProfile_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.USERS_GET_PROFILE );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseProfile );
		}
		
		/**
		 * Lists a user's favorite videos.
		 * 
		 * @param user The user to retrieve the favorite videos for. This is the same as the name that shows up on the YouTube website.
		 */		
		public function listFavoriteVideos( user:String ):void
		{
			MethodGroupHelper.invokeMethod( service, listFavoriteVideos_result, "youtube.users.list_favorite_videos", new NameValuePair("user",user) );
		}
		
		private function listFavoriteVideos_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.USERS_LIST_FAVORITE_VIDEOS );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseVideoList );
		}

		/**
		 * Lists a user's friends.
		 * 
		 * @param user The user to retrieve the friends for. This is the same as the name that shows up on the YouTube website.
		 */				
		public function listFriends( user:String ):void
		{
			MethodGroupHelper.invokeMethod( service, listFriends_result, "youtube.users.list_friends", new NameValuePair("user",user) );
		}
		
		private function listFriends_result( event:Event ):void
		{
			var result:YouTubeServiceEvent = new YouTubeServiceEvent( YouTubeServiceEvent.USERS_LIST_FRIENDS );
			
			MethodGroupHelper.processAndDispatch( service, URLLoader( event.target ).data, result,
												  MethodGroupHelper.parseFriendList );		
		}
		
	}
}