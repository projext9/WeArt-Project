package we.are.travelers.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;

import we.are.travelers.service.SnsLoginService;
import we.are.travelers.vo.MemberVo; 

/** * Handles requests for the application home page. */


@Controller
@RequestMapping("/*")
public class SnsLoginController { 	
	
	/* NaverLoginService */
	private SnsLoginService SnsLoginService;
	private String apiResult = null;	
	
	@Autowired	
	private void setSnsLoginService(SnsLoginService SnsLoginService) {		
		this.SnsLoginService = SnsLoginService;	
		} 	
	
	//로그인 첫 화면 요청 메소드	
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })	
	public String login(Model model, HttpSession session) {				
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */		
		String naverAuthUrl = SnsLoginService.getAuthorizationUrl(session);	
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&		
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		
		System.out.println("네이버:" + naverAuthUrl);				
		//네이버 		
		model.addAttribute("url", naverAuthUrl); 		
		return "login";	
		} 	
	
	//네이버 로그인 성공시 callback호출 메소드	
	@RequestMapping(value = "callBack", method = { RequestMethod.GET, RequestMethod.POST })	
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {				
		System.out.println("여기는 callback");	
		
		OAuth2AccessToken oauthToken;        
		oauthToken = SnsLoginService.getAccessToken(session, code, state);   
		
		//1. 로그인 사용자 정보를 읽어온다.		
		apiResult = SnsLoginService.getUserProfile(oauthToken);
		System.out.println("네이버 사용자 정보:" + apiResult);	
		
		//2. String형식인 apiResult를 json형태로 바꿈
		 JSONParser parser = new JSONParser();		
		 Object obj = parser.parse(apiResult);		
		 JSONObject jsonObj = (JSONObject) obj;	
		
		 //3. 데이터 파싱 		
		 //Top레벨 단계 _response 파싱		
		 JSONObject response_obj = (JSONObject)jsonObj.get("response");	
		 
		 //response의 nickname값 파싱
		 String email = (String)response_obj.get("email");
		 String nickname = (String)response_obj.get("nickname"); 		
		 System.out.println("네이버 닉네임" + nickname);
		 System.out.println("네이버 아이디" + email);
		 
		 HashMap<String, Object> naverInfo = new HashMap<>();
		 naverInfo.put("member_id", email);
		 naverInfo.put("member_nick", nickname);
		 
		 MemberVo result_naver = SnsLoginService.findNaver(naverInfo);

 		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
 		System.out.println("S:" + result_naver);
 		
 		int msg = 0;
 		
 		if(result_naver != null || result_naver == null ) {
 		
 		if(result_naver != null) { 
			  session.setAttribute("member_idx", naverInfo.get("member_idx")); //세션 생성	
			  session.setAttribute("member_id",  naverInfo.get("member_id")); //세션 생성	
			  session.setAttribute("member_nick", naverInfo.get("member_nick")); //세션 생성
			  session.setAttribute("member_regCode", naverInfo.get("member_regCode")); //세션 생성
			  msg=0;
 		}else {
 		// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
 			SnsLoginService.insertNaver(naverInfo);
 			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
 			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
			msg=1;
 	   }
 	}  
 		if(msg==0) {
 			 return "home";
 		}
 		else if(msg==1) {
 			  SnsLoginService.findNaver(naverInfo);
 			  session.setAttribute("member_idx", naverInfo.get("member_idx")); //세션 생성	
			  session.setAttribute("member_id",  naverInfo.get("member_id")); //세션 생성	
			  session.setAttribute("member_nick", naverInfo.get("member_nick")); //세션 생성
			  session.setAttribute("member_regCode", naverInfo.get("member_regCode")); //세션 생성	
			  return "home";
 	    }
 		return null;
	}
	
	//로그아웃	
	@RequestMapping(value = "/naverLogout", method = { RequestMethod.GET, RequestMethod.POST })	
	public String naverLogout(HttpSession session )throws IOException {			
		System.out.println("여기는 logout");			
		session.invalidate();			
		return "redirect:home.do";		
		}	
	
	
    //카카오 로그인
	@RequestMapping(value="/kakaoLogin.do")
	public String kakaologin(@RequestParam(value = "code", required = false) String code , HttpSession session) throws Exception {	
	System.out.println("code : " + code);
	
	String access_token = SnsLoginService.getAccessTokenK(code);
	MemberVo userInfo = SnsLoginService.getUserInfo(access_token);
	System.out.println("access_token : " + access_token);
	System.out.println("login Controller : " + userInfo);

	//    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    session.setAttribute("member_idx", userInfo.getMember_idx());
	    session.setAttribute("member_id" , userInfo.getMember_id());
	    session.setAttribute("member_nick", userInfo.getMember_nick());
	    session.setAttribute("member_regCode", userInfo.getMember_regCode());   
	    
	    return "home";
	   }
	
	 
	 

}