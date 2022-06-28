package we.are.travelers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.MemberDao;

@Service
public class AjaxService {
	
	private MemberDao memberDao;
	
	@Autowired
	public AjaxService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public int checkId(String id) {
		int result=0;
		result = memberDao.checkId(id);
		return result;
	}
	
	


}
