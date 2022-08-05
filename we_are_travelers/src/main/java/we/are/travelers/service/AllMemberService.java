package we.are.travelers.service;


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
	
	public MemberVo loginMember(MemberVo mv) { 
		
		 return memberDao.loginMember(mv); 
   }
	public MemberVo loginMemberDelynS(MemberVo mv) { 
		
		 return memberDao.loginMemberDelynS(mv); 
  } 
	

	public CompanyVo loginCompany(CompanyVo cv) { 
		
		 return companyDao.loginCompany(cv); 
}
	public CompanyVo loginCompany_auth(CompanyVo cv) { 
		
		 return companyDao.loginCompany_auth(cv); 
}
	public CompanyVo loginCompany_delynS(CompanyVo cv) { 
		
		 return companyDao.loginCompany_delynS(cv); 
}
	

}

