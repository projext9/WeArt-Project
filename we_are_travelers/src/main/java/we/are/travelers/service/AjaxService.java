package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.CompanyDao;
import we.are.travelers.dao.MemberDao;

@Service
public class AjaxService {
	
	private MemberDao memberDao;
	private CompanyDao companyDao;
	
	@Autowired
	public AjaxService(MemberDao memberDao , CompanyDao companyDao) {
		this.memberDao = memberDao;
		this.companyDao = companyDao;
	}
	

	public int checkId(String member_id) {
		
		int id_check_result=0;
		
		id_check_result = memberDao.checkId(member_id);
		
		return id_check_result;
	}
	
public int checkId1(String member_id) {
		
		int id_check_result=0;
		
		id_check_result = memberDao.checkId1(member_id);
		
		return id_check_result;
	}
	
	
	public int checkComId(String company_id) {
		
		int id_check_result=0;
		
		id_check_result = companyDao.checkComId(company_id);
		
		return id_check_result;
	}
	
public int checkComId1(String company_id) {
		
		int id_check_result=0;
		
		id_check_result = companyDao.checkComId1(company_id);
		
		return id_check_result;
	}
	
	public int checkNick(String nick) {
		
		int nick_check_result=0;
		
		nick_check_result = memberDao.checkNick(nick);
		
		return nick_check_result;
	
	}
	
	public int checkComName(String name) {
		int name_check_result=0;
		name_check_result = companyDao.checkComName(name);
		return name_check_result;
	
	}


}
