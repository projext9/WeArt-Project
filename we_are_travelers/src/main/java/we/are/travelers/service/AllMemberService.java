package we.are.travelers.service;

import java.util.HashMap;

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
	public AllMemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	//회원가입 처리 메소드:join()
	public int joinMember(MemberVo mv) {
		int result_member=0;//입력 실패
		
		result_member = memberDao.joinMember(mv);
		
		return result_member;
	}
	
	public int joinCompany(CompanyVo companyVo) {
		int result_company=0;//입력 실패
		
		result_company = companyDao.joinCompany(companyVo);
		
		return result_company;
	

	}
	
	public MemberVo loginMember(MemberVo mv) { 
		
		 return memberDao.loginMember(mv); 
}

	public CompanyVo loginCompany(CompanyVo cv) { 
		
		 return companyDao.loginCompany(cv); 
}
	
	
	
	
}
//	public HashMap<String, Long> loginMember(HashMap<String,String> loginMemberInfo) {
//		return memberDao.loginMember(loginMemberInfo);

     
//	public HashMap<String, Long> loginCompany(CompanyVo companyVo) { 
//		
//		 return companyDao.loginCompany(companyVo); 
//}
//
//	
//	public HashMap<String, Long> loginCompany(HashMap<String,String> loginInfo) {
//		return companyDao.loginCompany(loginCompanyInfo);
//	}

