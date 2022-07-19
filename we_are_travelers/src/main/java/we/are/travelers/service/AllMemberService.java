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
	public int joinMember(MemberVo memberVo) {
		int result_member=0;//입력 실패
		
		result_member = memberDao.joinMember(memberVo);
		
		return result_member;
	}
	
	public int joinCompany(CompanyVo companyVo) {
		int result_company=0;//입력 실패
		
		result_company = companyDao.joinCompany(companyVo);
		
		return result_company;
	

	}
	/*
	 * public HashMap<String, Long> login(MemberVo memberVo) { return
	 * memberDao.loginMember(memberVo); }
	 */
	
	public HashMap<String, Long> login(HashMap<String,String> loginInfo) {
		return memberDao.loginMember(loginInfo);
	}



}
