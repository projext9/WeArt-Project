# WeArt-Project
Team WeArt / Java Spring Web Project

로그인 인터셉터 페이지 예외처리는 / servlet-context.xml에서 하시면 됩니다.



현재 예외처리 페이지
			<!-- 예외처리 시작 -->
			<!-- HomeController -->
			<exclude-mapping path="/home.do"/>
			
			<!-- TestController -->
			<exclude-mapping path="/testlogin.do"/>
			<exclude-mapping path="/testloginProcess.do"/>
			
			<!-- AllMemberController -->
			<exclude-mapping path="/login.do"/>
			<exclude-mapping path="/MemberloginProcess.do"/>
			<exclude-mapping path="/joinMember.do"/>
			<exclude-mapping path="/joinCompany.do"/>
			<exclude-mapping path="/kakaoLogin.do"/>
			<exclude-mapping path="/WeArtTermsOfService.do"/>
			<exclude-mapping path="/WeArtPersnolInfo.do"/>
			<exclude-mapping path="/WeArtMarketing.do"/>
			<exclude-mapping path="/joinNext.do"/>
			<exclude-mapping path="/fileUploadProcess.do"/>
			<exclude-mapping path="/joinNext3.do"/>
			<exclude-mapping path="/joinfinish.do"/>
			<exclude-mapping path="/CompanyTermsOfService.do"/>
			<exclude-mapping path="/CompanyInfo.do"/>
			<exclude-mapping path="/CompanyInfo_other.do"/>
			<exclude-mapping path="/CompanyMarketing.do"/>
			<exclude-mapping path="/join_com_next.do"/>
			<exclude-mapping path="/join_com_next2.do"/>
			<exclude-mapping path="/join_com_next3.do"/>
			<exclude-mapping path="/join_com_next4.do"/>
			<exclude-mapping path="/join_com_finish.do"/>
			<exclude-mapping path="/joinMemberProcess.do"/>
			<exclude-mapping path="/joinCompanyProcess.do"/>
			<exclude-mapping path="/logout.do"/>
			
			<!-- BoardController -->
			<exclude-mapping path="/board_list.do"/>
			<exclude-mapping path="/board_content.do"/>
			<exclude-mapping path="/notice_list.do"/>
			<exclude-mapping path="/notice_content.do"/>
			<exclude-mapping path="/like_count.do"/>
			
			<!-- ItemController -->
			<exclude-mapping path="/cultureshop.do"/>
			<exclude-mapping path="/activityshop.do"/>
			<exclude-mapping path="/fishingshop.do"/>
			<exclude-mapping path="/campingshop.do"/>
			<exclude-mapping path="/stayshop.do"/>
			<exclude-mapping path="/itemdetail.do"/>
