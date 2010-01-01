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
	import flash.events.Event;
	import flexunit.framework.TestCase;
	import com.adobe.webapis.youtube.*;
	import com.adobe.webapis.youtube.events.*;
	import com.adobe.webapis.youtube.methodgroups.*;
	
	public class YouTubeServiceTest extends TestCase
	{
	
		private static var API_KEY:String = "";//<PUT YOUR KEY HERE TO TEST>
		private static var TIMEOUT:Number = 10000;
		
		public function testAPIKEY():void
		{
			assertTrue( "You must set your API ket in com.adobe.webapis.youtube.YouTubeServiceTest", 
						YouTubeServiceTest.API_KEY.length > 0 );
		}
		
		public function testConstruct():void
		{
			var s:YouTubeService = new YouTubeService();
			assertNotNull( s );
		}
		
		public function testConstructWithKey():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			assertNotNull( s );
			assertEquals( API_KEY, s.apiKey );
		}
		
		public function testUsersGetProfile():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.USERS_GET_PROFILE, 
 							    addAsync( onUsersGetProfile, TIMEOUT ) );
			s.users.getProfile("ddura");
		}
		
		private function onUsersGetProfile( event:YouTubeServiceEvent ):void
		{
			var x:Number = 0;
			assertFalse( "no error", YouTubeServiceEvent( event ).error );
			assertNotNull( "has profile", YouTubeServiceEvent( event ).data.profile );
		}

		public function testGetProfileError():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.USERS_GET_PROFILE, 
 							    addAsync( onUsersGetProfileError, TIMEOUT ) );
			s.users.getProfile("NONEXISTANTUSER");
		}		
		
		private function onUsersGetProfileError( event:YouTubeServiceEvent ):void
		{
			assertTrue( "is error", YouTubeServiceEvent( event ).error );
		}
		
				
		public function testUsersListFavoriteVideos():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.USERS_LIST_FAVORITE_VIDEOS, 
 							    addAsync( onUsersListFavoriteVideos, TIMEOUT ) );
			s.users.listFavoriteVideos("ddura");
		}
		
		private function onUsersListFavoriteVideos( event:YouTubeServiceEvent ):void
		{
			assertFalse( "no error", YouTubeServiceEvent( event ).error );
		}		
		
		public function testVideosListByTag():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.VIDEOS_LIST_BY_TAG, 
 							    addAsync( onVideosListByTag, TIMEOUT ) );
			s.videos.listByTag("sanfrancisco");
		}
		
		private function onVideosListByTag( event:YouTubeServiceEvent ):void
		{
			assertFalse( "no error", YouTubeServiceEvent( event ).error );
		}	
		
		public function testVideosGetDetails():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.VIDEOS_GET_DETAILS, 
 							    addAsync( onVideosGetDetails, TIMEOUT ) );
			s.videos.getDetails("Its2peUsF_c");			
		}
		
		public function onVideosGetDetails( event:YouTubeServiceEvent ):void
		{
			assertFalse( "no error", event.error );
		}
		
		public function testVideosListByUser():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.VIDEOS_LIST_BY_USER, 
 							    addAsync( onVideosListByUser, TIMEOUT ) );
			s.videos.listByUser("youtube");			
		}
		
		public function onVideosListByUser( event:YouTubeServiceEvent ):void
		{
			assertFalse( "no error", event.error );
		}		

		public function testVideosListFeatured():void
		{
			var s:YouTubeService = new YouTubeService( API_KEY );
			s.addEventListener( YouTubeServiceEvent.VIDEOS_LIST_FEATURED, 
 							    addAsync( onVideosListFeatured, TIMEOUT ) );
			s.videos.listFeatured();
		}
		
		public function onVideosListFeatured( event:YouTubeServiceEvent ):void
		{
			assertFalse( "no error", event.error );
		}
		
		public function testParseProfile():void
		{
			var response:XML =  <ut_response status="ok">
									<user_profile>
								        <first_name>Bob</first_name>
								        <last_name>Jones</last_name>
								        <about_me>This is my profile</about_me>
								        <age>29</age>
								        <video_upload_count>7</video_upload_count>
								        <video_watch_count>16</video_watch_count>
								        <homepage>http://www.myhomepage.com/</homepage>
								        <hometown>Los Angeles, CA</hometown>
								        <gender>m</gender> <!-- m or f -->
								        <occupations>Abstract Artist</occupations>
								        <companies>YouTube</companies>
								        <city>San Francisco, CA</city>
								        <country>US</country>
								        <books>Learning Python</books>
								        <hobbies>YouTube, YouTube, YouTube</hobbies>
								        <movies>Star Wars Original Trilogy</movies>
								        <relationship>taken</relationship>
								        <friend_count>5</friend_count>
								        <favorite_video_count>15</favorite_video_count>
								        <currently_on>true</currently_on>
									</user_profile>
								</ut_response>

			var data:Object = MethodGroupHelper.parseProfile( response );
			assertEquals( data.profile.firstName, "Bob" );
			assertEquals( data.profile.lastName, "Jones" );
			assertEquals( data.profile.aboutMe, "This is my profile" );
			assertEquals( data.profile.age, 29 );
			assertEquals( data.profile.videoUploadCount, 7 );
			assertEquals( data.profile.videoWatchCount, 16 );
			assertEquals( data.profile.homepage, "http://www.myhomepage.com/" );
			assertEquals( data.profile.hometown, "Los Angeles, CA" );
			assertEquals( data.profile.gender, "m" );
			assertEquals( data.profile.occupations, "Abstract Artist" );
			assertEquals( data.profile.companies, "YouTube" );
			assertEquals( data.profile.city, "San Francisco, CA" );
			assertEquals( data.profile.country, "US" );
			assertEquals( data.profile.books, "Learning Python" );
			assertEquals( data.profile.hobbies, "YouTube, YouTube, YouTube" );
			assertEquals( data.profile.movies, "Star Wars Original Trilogy" );
			assertEquals( data.profile.relationship, "taken" );
			assertEquals( data.profile.friendCount, 5 );
			assertEquals( data.profile.favoriteVideoCount, 15 );
			assertEquals( data.profile.currentlyOn, true );								
		}
		
		public function testParseVideoList():void
		{
			var x:XML = <ut_response status="ok">
							<video_list>
								<video>
						            <author>youtuberocks</author>
						            <id>k0gEeue2sLk</id> <!-- this ID can be used with youtube.videos.get_details -->
						            <title>My First Motion Picture</title>
						            <length_seconds>16</length_seconds> <!-- length of video -->
						            <rating_avg>3.75</rating_avg>
						            <rating_count>10</rating_count>
						            <description>This is the video description shown on the YouTube site.</description>
						            <view_count>170</view_count>
						            <upload_time>1121398533</upload_time> <!-- UNIX-style time, secs since 1/1/1970 -->
						            <comment_count>1</comment_count> <!-- how many comments does this video have? -->
						            <tags>feature film documentary</tags>
						            <url>http://www.youtube.com/?v=k04Eeue24Lk</url>
						            <thumbnail_url>http://static.youtube.com/get_still?video_id=k04Eeue24Lk</thumbnail_url>
							    </video>	
								<video>
						            <author>youtuberocks</author>
						            <id>k0gEeue2sLk</id> <!-- this ID can be used with youtube.videos.get_details -->
						            <title>My First Motion Picture</title>
						            <length_seconds>16</length_seconds> <!-- length of video -->
						            <rating_avg>3.75</rating_avg>
						            <rating_count>10</rating_count>
						            <description>This is the video description shown on the YouTube site.</description>
						            <view_count>170</view_count>
						            <upload_time>1121398533</upload_time> <!-- UNIX-style time, secs since 1/1/1970 -->
						            <comment_count>1</comment_count> <!-- how many comments does this video have? -->
						            <tags>feature film documentary</tags>
						            <url>http://www.youtube.com/?v=k04Eeue24Lk</url>
						            <thumbnail_url>http://static.youtube.com/get_still?video_id=k04Eeue24Lk</thumbnail_url>
							    </video>								    
						    </video_list>
					    </ut_response>
			
			var data:Object = MethodGroupHelper.parseVideoList( x );
			
			assertTrue("has 2 videos", data.videoList.length == 2 );
			assertEquals( data.videoList[0].author, "youtuberocks" );
			assertEquals( data.videoList[0].id, "k0gEeue2sLk" );
			assertEquals( data.videoList[0].title, "My First Motion Picture" );
			assertEquals( data.videoList[0].lengthSeconds, 16 );
			assertEquals( data.videoList[0].ratingAvg, 3.75 );
			assertEquals( data.videoList[0].ratingCount, 10 );
			assertEquals( data.videoList[0].description, "This is the video description shown on the YouTube site." );
			assertEquals( data.videoList[0].viewCount, 170 );
			assertEquals( data.videoList[0].uploadTime.getTime(), 1121398533 );
			assertEquals( data.videoList[0].commentCount, 1 );
			assertEquals( data.videoList[0].tags, "feature film documentary" );
			assertEquals( data.videoList[0].url, "http://www.youtube.com/?v=k04Eeue24Lk" );
			assertEquals( data.videoList[0].thumbnailUrl, "http://static.youtube.com/get_still?video_id=k04Eeue24Lk" );
			assertEquals( data.videoList[0].playerURL, "http://www.youtube.com/v/k0gEeue2sLk" );
		}		
		
		public function testParseFriendList():void
		{
			var fl:XML = 	<ut_response status="ok">
								<friend_list>
									<friend>
							                <user>username1</user>
							                <video_upload_count>1</video_upload_count>
							                <favorite_count>2</favorite_count>
							                <friend_count>3</friend_count>
							        </friend>
							        <friend>
							                <user>username2</user>
							                <video_upload_count>5</video_upload_count>
							                <favorite_count>3</favorite_count>
							                <friend_count>2</friend_count>
							        </friend>
						        </friend_list>
					        </ut_response>
					        
			var data:Object = MethodGroupHelper.parseFriendList( fl );
			
			assertTrue( "has 2 friends", data.friendList.length == 2 );
			assertEquals( "username1", data.friendList[0].user );
			assertEquals( 1, data.friendList[0].videoUploadCount );
			assertEquals( 2, data.friendList[0].favoriteCount );
			assertEquals( 3, data.friendList[0].friendCount );
					        
		}
		
		public function testParseVideoDetails():void
		{
			var vd:XML = <ut_response status="ok">
							<video_details>
							    <author>youtubeuser</author>
							    <title>My Trip to California</title>
							    <rating_avg>3.25</rating_avg>
							    <rating_count>10</rating_count>
							    <tags>california trip redwoods</tags>
							    <description>This video shows some highlights of my trip to California last year.</description>
							    <update_time>1129803584</update_time> <!-- UNIX time, secs since 1/1/70 -->
							    <view_count>7</view_count>
							    <upload_time>1127760809</upload_time> <!-- UNIX time, secs since 1/1/70 -->
							    <length_seconds>8</length_seconds>
							    <recording_date>None</recording_date>
							    <recording_location/>
							    <recording_country/>
							    <comment_list>
							            <comment>
							                    <author>steve</author>
							                    <text>asdfasdf</text>
							                    <time>1129773022</time>
							            </comment>
							    </comment_list>
							    <channel_list>
							            <channel>Humor</channel>
							            <channel>Odd & Outrageous</channel>
							    </channel_list>
							</video_details>				
						</ut_response>
		
			var data:Object = MethodGroupHelper.parseVideoDetails( vd );
			
			assertEquals( data.videoDetails.author, "youtubeuser" );
			assertEquals( data.videoDetails.title, "My Trip to California" );
			assertEquals( data.videoDetails.ratingAvg, 3.25 );
			assertEquals( data.videoDetails.ratingCount, 10 );
			assertEquals( data.videoDetails.tags, "california trip redwoods");
			assertEquals( data.videoDetails.description, "This video shows some highlights of my trip to California last year." );
			assertEquals( data.videoDetails.updateTime.getTime(), 1129803584 );
			assertEquals( data.videoDetails.viewCount, 7 );
			assertEquals( data.videoDetails.uploadTime.getTime(), 1127760809 );
			assertEquals( data.videoDetails.lengthSeconds, 8 );
			assertEquals( data.videoDetails.recordingDate, "None" );
			assertEquals( data.videoDetails.recordingLocation, "" );
			assertEquals( data.videoDetails.recordingCountry, "" );
			assertEquals( data.videoDetails.commentList.length, 1 );
			assertEquals( data.videoDetails.commentList[0].author, "steve" );
			assertEquals( data.videoDetails.commentList[0].text, "asdfasdf" );
			assertEquals( data.videoDetails.commentList[0].time.getTime(), 1129773022 );			
			assertEquals( data.videoDetails.channelList.length, 2 );
			assertEquals( data.videoDetails.channelList[0], "Humor" );
			assertEquals( data.videoDetails.channelList[1], "Odd & Outrageous" );
		}
	}
}