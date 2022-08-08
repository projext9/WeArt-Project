package we.are.travelers.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.util.Utils;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;

import we.are.travelers.service.SnsLoginService;


@Controller
public class GoogleController {
	
	private SnsLoginService SnsLoginService;
	
	@Autowired	
	private GoogleController(SnsLoginService SnsLoginService) {		
		this.SnsLoginService = SnsLoginService;	
		
		} 	
	
	@RequestMapping(value="/googleLogin.do", method=RequestMethod.POST)
	 @ResponseBody
	 public String googleLogin(String idtoken, Model model, HttpSession session) throws GeneralSecurityException, IOException {
		
	 	HttpTransport transport = Utils.getDefaultTransport();
	 	JsonFactory jsonFactory = Utils.getDefaultJsonFactory();
	 	
	 	GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
	 			.setAudience(Collections.singletonList("630681492572-civqbb1ns8p732fm3357jpcedprr3u47.apps.googleusercontent.com")).build(); 	
	 	
	 	GoogleIdToken idToken = verifier.verify(idtoken);
	 	
	 		Payload payload = idToken.getPayload();
	
	 		HashMap<String, Object> googleInfo = new HashMap<>();
	 		googleInfo.put("social_google" , payload.get("email"));
 			googleInfo.put("member_nick" , payload.get("given_name"));
 			
 			 
 			 String result_google = SnsLoginService.findGoogle(googleInfo);
 			
    		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
    		System.out.println("S:" + result_google);
    		int msg = 0;
     		
     		if(result_google != null || result_google == null ) {
     		
     		if(result_google != null) { 
    			  session.setAttribute("member_idx", googleInfo.get("member_idx")); //세션 생성	
    			  session.setAttribute("social_google",  googleInfo.get("social_google")); //세션 생성	
    			  session.setAttribute("member_nick", googleInfo.get("member_nick")); //세션 생성				
    			  msg=0;
    			  
     		}else {
     		// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
     			SnsLoginService.insertGoogle(googleInfo);
     			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
     			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
    			msg=1;
     	   }
     	   }  
     		if(msg==0) {
     			 return "home";
     		}
     		else if(msg==1) {
     			  SnsLoginService.findNaver(googleInfo);
     			  session.setAttribute("member_idx", googleInfo.get("member_idx")); //세션 생성	
    			  session.setAttribute("social_naver",  googleInfo.get("social_google")); //세션 생성	
    			  session.setAttribute("member_nick", googleInfo.get("member_nick")); //세션 생성				
    			  return "home";
     	    }
			return result_google;
	}
}

	     
