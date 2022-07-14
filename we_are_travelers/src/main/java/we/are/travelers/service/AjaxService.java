package we.are.travelers.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.AdminDao;
import we.are.travelers.dao.MemberDao;

@Service
public class AjaxService {
	
	private MemberDao memberDao;
	private AdminDao adminDao;
	
	@Autowired //의존 자동주입: 생성자 방식
	public AjaxService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Autowired //의존 자종주입: setter 방식
	public void serAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public int checkId(String id) {
		int result=0;
		result = memberDao.checkId(id);
		return result;
	}

	public int updateMemberGrade(HashMap<String, Integer> map) {
		return adminDao.updateMemberGrade(map);
	}

	public int deleteMemberInfo(List<Integer> member_idx_list) {
		return adminDao.deleteMemberInfo(member_idx_list);
	}
	
	


}