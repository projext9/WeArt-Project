package we.are.travelers.vo;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverLoginVo extends DefaultApi20{ 
	
	protected NaverLoginVo(){    
		
	}     
	private static class InstanceHolder{ 
		
		private static final NaverLoginVo INSTANCE = new NaverLoginVo();  
		
	}      
	public static NaverLoginVo instance(){  
		
	   return InstanceHolder.INSTANCE;    
	}     
    @Override    
	public String getAccessTokenEndpoint() {
    	
			return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";    
		}                       
	@Override    
		protected String getAuthorizationBaseUrl() {   
		
			return "https://nid.naver.com/oauth2.0/authorize";   
		}   
}

