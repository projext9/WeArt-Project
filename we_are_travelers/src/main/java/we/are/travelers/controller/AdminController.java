package we.are.travelers.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import we.are.travelers.service.AdminService;
import we.are.travelers.vo.MemberVo;

@Controller
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do") //get방식 요청 처리 <!-- admin_home.jsp 호출 -->
	public String adminHome() {
		return "admin/admin_home";
	}
	
	@GetMapping("/memberList.do") //get방식 요청 처리 <!-- admin_memberList.jsp 호출 -->
	public String getMemberList(Model model) {
		
		List<MemberVo> memberList = adminService.getMemberList(); //MemberVo를 memberList 라는 이름으로...
		//모델객체에 회원목록을 추가함 //adminService의 getMemberList 메소드 실행
		model.addAttribute("memberList",memberList); //모델객체에 memberList라는 이름으로 저장
		
		return "admin/admin_memberList"; //저장된 객체를 여기로 보냅
	}
	
	
	
}
