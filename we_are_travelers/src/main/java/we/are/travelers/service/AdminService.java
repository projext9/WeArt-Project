package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.AdminDao;
import we.are.travelers.vo.MemberVo;

@Service
public class AdminService {
	
	private AdminDao adminDao;
	
	@Autowired
	public AdminService(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
	public List<MemberVo> getMemberList() { //AdminController에서 getMemberList 실행시
		return adminDao.getMemberList(); //adminDao의 getMemberList 메소드 실행
	}

}
