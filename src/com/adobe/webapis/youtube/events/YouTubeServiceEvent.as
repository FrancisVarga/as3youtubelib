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

package com.adobe.webapis.youtube.events
{
	import com.adobe.webapis.events.ServiceEvent;
	
	public class YouTubeServiceEvent extends ServiceEvent
	{	
		/**
		 * Event dispatched when the service has returned the user profile. The
		 * event data object contains a Profile instance named 'profile'.
		 * 
		 * @eventType getProfile
		 */
		public static var USERS_GET_PROFILE:String 			= "onGetProfile";
		
		/**
		 * Event dispatched when the service has returned the users list of
		 * favorite videos. The event data object contains an array of Video
		 * instances called 'videos'.
		 * 
		 * @eventType listFavoriteVideos
		 */
		public static var USERS_LIST_FAVORITE_VIDEOS:String = "onListFavoriteVideos";
		
		/**
		 * Event dispatched when the service has returned the users list of
		 * friends. The event data object contains an array of Friend
		 * instances called 'friendList'.
		 * 
		 * @eventType listFriends
		 */
		public static var USERS_LIST_FRIENDS:String 		= "onListFriends";
		
		/**
		 * Event dispatched when the service has returned the details for a
		 * specified video. The event data object contains a VideoDetails instance
		 * called 'videoDetails'.
		 */		
		public static var VIDEOS_GET_DETAILS:String 		= "onGetDetails";
		
		/**
		 * Event dispatched when the service has returned the list of videos uploaded
		 * by the specified user. The event data object contains an array of Video
		 * instances called 'videos'.
		 * 
		 * @eventType listByUser
		 */		
		public static var VIDEOS_LIST_BY_USER:String 		= "onListByUser";
		
		/**
		 * Event dispatched when the service has returned the list of videos that contain
		 * the specified tag. The event data object contains an array of Video
		 * instances called 'videos'.
		 * 
		 * @eventType listByTag
		 */				
		public static var VIDEOS_LIST_BY_TAG:String 		= "onListByTag";
		
		/**
		 * Event dispatched when the service has returned the list of the top 25 featured videos
		 * currently listed on YouTube. The event data object contains an array of Video
		 * instances called 'videos'.
		 * 
		 * @eventType listFeatured
		 */		
		public static var VIDEOS_LIST_FEATURED:String 		= "onListFeatured";
		
		/**
		 *	Set to true if a call to the service resulted in an error.
		 */
		public var error:Boolean = false;
		
		/**
		 * Constructs a new YouTubeServiceEvent
		 */
		public function YouTubeServiceEvent( type:String, 
										   	 bubbles:Boolean = false, 
										     cancelable:Boolean = false )
		{								   	
			super( type, bubbles, cancelable );
		}

	}
}