package we.are.travelers.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;

import org.json.JSONObject;
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
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import we.are.travelers.service.SnsLoginService;
import we.are.travelers.vo.MemberVo;

@Controller
public class GoogleController {
	
	private SnsLoginService SnsLoginService ;
	
	@Autowired	
	private void setSnsLoginService(SnsLoginService SnsLoginService) {		
		this.SnsLoginService = SnsLoginService;	
		} 	
	
	@RequestMapping(value="member/google_login", method=RequestMethod.POST)
	 @ResponseBody
	 public String googleLogin(String idtoken, Model model) throws GeneralSecurityException, IOException {
	 	HttpTransport transport = Utils.getDefaultTransport();
	 	JsonFactory jsonFactory = Utils.getDefaultJsonFactory();
	 	
	 	GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
	 			.setAudience(Collections.singletonList("917082913901-5alh4m7o4lq42fsvo2k4jnfdcrdaqraq.apps.googleusercontent.com")).build();
	 	
	 	JSONObject json = new JSONObject();
	 	
	 	GoogleIdToken idToken = verifier.verify(idtoken);
	 	
	 		Payload payload = idToken.getPayload();
	 		
	 		HashMap<String, Object> googleInfo = new HashMap<>();
	 		
	 		if (idToken != null) { //회원가입이 안 되어 있는 경우
	 	
	 			googleInfo.put("member_id" , payload.get("email"));
	 			googleInfo.put("member_nick" , payload.get("given_name"));
	 			
	 		}//end if
	 			
	 		model.addAttribute("id", (String) payload.get("email"));
	 		json.put("login_result", "success");
	 			
	 	} else { //유효하지 않은 토큰
	 		json.put("login_result", "fail");
	 	}//end else
	 		
	 	return json.toString();
	     
	 }//googleLogin
}
