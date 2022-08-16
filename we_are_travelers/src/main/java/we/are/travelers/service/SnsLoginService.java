package we.are.travelers.service;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.UUID; 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils; 
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import we.are.travelers.dao.MemberDao;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.NaverLoginVo;


@Service
public class SnsLoginService {
	
	int msg=0;
	
	private MemberDao memberDao;

	@Autowired
	public SnsLoginService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	public MemberVo findNaver(HashMap<String, Object> naverInfo){
	  	  System.out.println("네이버 아이디:"+naverInfo.get("member_id"));
	  	  System.out.println("네이버 닉네임:"+naverInfo.get("member_nick"));
		  return memberDao.findNaver(naverInfo);  
	}
	public MemberVo insertNaver(HashMap<String, Object> naverInfo){
	  	  System.out.println("네이버 아이디:"+naverInfo.get("member_id"));
	  	  System.out.println("네이버 닉네임:"+naverInfo.get("member_nick"));
		  return memberDao.insertNaver(naverInfo);  
	}
	
	/* 인증 요청문을 구성하는 파라미터 */		
	//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디		
	//response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.		
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.		
	//state: 애플리케이션이 생성한 상태 토큰		
	
	private final static String CLIENT_ID = "8wiX4XDwuFzLKIWwnbMY";	    
	private final static String CLIENT_SECRET = "cjLEbW23Nb";	    
	private final static String REDIRECT_URI = "http://localhost:8090/travelers/callBack";	    
	private final static String SESSION_STATE = "oauth_state";	
	
	/* 프로필 조회 API URL */	    
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* 네이버 아이디로 인증  URL 생성  Method */	    
	public String getAuthorizationUrl(HttpSession session) { 	
		
		/* 세션 유효성 검증을 위하여 난수를 생성 */	        
		String state = generateRandomString();	   
		
		/* 생성한 난수 값을 session에 저장 */	        
		setSession(session,state);         	        
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */	        
		OAuth20Service oauthService = new ServiceBuilder()                                                   	                
				.apiKey(CLIENT_ID)	                
				.apiSecret(CLIENT_SECRET)	                
				.callback(REDIRECT_URI)	                
				.state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함	                
				.build(NaverLoginVo.instance()); 	        
		return oauthService.getAuthorizationUrl();	    
		} 	
	
	/* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */	    
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{ 
		
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */	        
		String sessionState = getSession(session);	        
		if(StringUtils.pathEquals(sessionState, state)){ 	            
			OAuth20Service oauthService = new ServiceBuilder()	                    
					.apiKey(CLIENT_ID)	                    
					.apiSecret(CLIENT_SECRET)	                    
					.callback(REDIRECT_URI)	                    
					.state(state)	                    
					.build(NaverLoginVo.instance()); 	
			
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */	            
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);	
			
			return accessToken;	        
			}	        
	         return null;	    
	        } 	    
	/* 세션 유효성 검증을 위한 난수 생성기 */	    
	private String generateRandomString() {	        
		return UUID.randomUUID().toString();	    
		} 	    
	/* http session에 데이터 저장 */	    
	private void setSession(HttpSession session, String state){	        
		session.setAttribute(SESSION_STATE, state);     	    
		} 	    
	/* http session에서 데이터 가져오기 */ 	   
	private String getSession(HttpSession session){	        
		return (String) session.getAttribute(SESSION_STATE);	    
		}	   

	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{ 	       
		OAuth20Service oauthService =new ServiceBuilder()	                
				.apiKey(CLIENT_ID)	                
				.apiSecret(CLIENT_SECRET)	                
				.callback(REDIRECT_URI).build(NaverLoginVo.instance()); 	            
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);	        
		oauthService.signRequest(oauthToken, request);	        
		Response response = request.send();	        
		return response.getBody();	    
		} 
	
	
	
	
	//카카오 AccessToken 획득 로직
	public String getAccessTokenK (String authorize_code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code"); 
			sb.append("&client_id=8a2ee7f6ccee51f630888d04e48e6d7b"); //본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8090/travelers/kakaoLogin.do"); // 본인이 설정한 주소
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			System.out.println("sb:"+sb);
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_token;
	}
	 
	 public MemberVo getUserInfo (String access_token) {

	        //요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	        HashMap<String, Object> userInfo = new HashMap<>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        
	        
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");

	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);

	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	           
	            userInfo.put("member_nick", nickname);
	            userInfo.put("member_id", email);

	        } catch (IOException e) {
	         
	            e.printStackTrace();
	            
	        }

	        // catch 아래 코드 추가.
	        MemberVo result_kakao = memberDao.findKakao(userInfo);
    		// 위 코드는 먼저 정보가 저장되있는지 확인하는 코드.
    		System.out.println("S:" + result_kakao);
  
    		if(result_kakao==null) {
    		// result가 null이면 정보가 저장이 안되있는거므로 정보를 저장.
    			memberDao.insertKakao(userInfo);
    			// 위 코드가 정보를 저장하기 위해 Repository로 보내는 코드임.
    			return memberDao.findKakao(userInfo);
    			// 위 코드는 정보 저장 후 컨트롤러에 정보를 보내는 코드임.
    			//  result를 리턴으로 보내면 null이 리턴되므로 위 코드를 사용.
    		} else {
    			return result_kakao;
    			// 정보가 이미 있기 때문에 result를 리턴함.
    		}
			
 }

	  public void kakaoLogout(String access_token) {
	        String reqURL = "https://kapi.kakao.com/v1/user/logout";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            conn.setRequestProperty("Authorization", "Bearer " + access_token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String result = "";
	            String line = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println(result);
	        } catch (IOException e) {
	           
	            e.printStackTrace();
	        }
	        
	  }

	}
