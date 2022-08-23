package we.are.travelers.service;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import we.are.travelers.dao.CompanyDao;
import we.are.travelers.dao.MemberDao;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.MemberVo;

@Service
public class AllMemberService {
	
	private CompanyDao companyDao;
	private MemberDao memberDao;
	
	@Autowired
	public AllMemberService(MemberDao memberDao , CompanyDao companyDao) {
		this.memberDao = memberDao;
		this.companyDao = companyDao;
	}
	
	//회원가입 처리 메소드:join()
	public int joinMember(MemberVo mv) {  
		
		int result_member=0;//입력 실패
		
		result_member = memberDao.joinMember(mv);
		
		return result_member;
	}
	
	public int joinCompany(CompanyVo cv) {
		
		int result_company=0;//입력 실패
		
		result_company = companyDao.joinCompany(cv);
		
		return result_company;
	}
	
	public MemberVo loginMember(MemberVo mv) throws NoSuchAlgorithmException { 
		
        String member_pwd = mv.getMember_pwd();
        
        System.out.println(member_pwd);
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		 
        md.update(member_pwd.getBytes());
 
        StringBuilder builder = new StringBuilder();
 
        for (byte b: md.digest()) {
            builder.append(String.format("%02x", b));
        }
        String pwd_result = builder.toString();
        
        System.out.println(pwd_result); //88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589
        
        mv.setMember_pwd(pwd_result);
        
        System.out.println("암호화 : " + pwd_result);
        
		 return memberDao.loginMember(mv); 
   }
	public MemberVo loginMemberDelynS(MemberVo mv) { 
		
		 return memberDao.loginMemberDelynS(mv); 
  } 
	
	public CompanyVo loginCompany(CompanyVo cv) throws NoSuchAlgorithmException { 
		
		 String company_pwd = cv.getCompany_pwd();
	        
	        System.out.println(company_pwd);
			
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			 
	        md.update(company_pwd.getBytes());
	 
	        StringBuilder builder = new StringBuilder();
	 
	        for (byte b: md.digest()) {
	            builder.append(String.format("%02x", b));
	        }
	        String pwd_result = builder.toString();
	        
	        System.out.println(pwd_result); //88d4266fd4e6338d13b845fcf289579d209c897823b9217da3e161936f031589
	        
	        cv.setCompany_pwd(pwd_result);
	        
	        System.out.println("암호화 : " + pwd_result);
		
		 return companyDao.loginCompany(cv); 
}
	public CompanyVo loginCompany_auth(CompanyVo cv) { 
		
		 return companyDao.loginCompany_auth(cv); 
}
	public CompanyVo loginCompany_delynS(CompanyVo cv) { 
		
		 return companyDao.loginCompany_delynS(cv); 
}
	

}

