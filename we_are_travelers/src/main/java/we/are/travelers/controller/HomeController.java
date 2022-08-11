package we.are.travelers.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.travelers.service.TestService;

@Controller
public class HomeController {
	
	private TestService testService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public HomeController(TestService testService) {
		this.testService = testService;
	}
	
	@RequestMapping("/")//get방식 요청 처리
	public String home() {
		return "home";
	}
	
	@GetMapping("/home.do")//get방식 요청 처리
	public String home2() {
		return "home";
	}
	
	//테스트 로그인 모듈1
	@GetMapping("/testlogin.do")
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "test/testlogin";
	}
	
	//테스트 로그인 모듈2
	@PostMapping("/testloginProcess.do")
	public String loginProcess(@RequestParam("member_id") String member_id,
			 					@RequestParam("member_pw") String member_pwd, 
			 					HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);

		HashMap<String, String> resultMap1 = testService.testlogin(map);

		if(resultMap1 != null) {
			String member_idx = resultMap1.get("member_idx"); //회원 idx
			String member_nick = resultMap1.get("member_nick"); //회원 닉네임
			
			session.setAttribute("member_idx", member_idx); //회원 idx 추가
			session.setAttribute("member_nick", member_nick); //회원 닉네임 추가
			return "home";
		} else if(resultMap1 == null) {
			HashMap<String, String> resultMap2 = testService.testlogincompany(map);
			if(resultMap2 != null) { 
				String company_idx = resultMap2.get("company_idx"); //기업회원 idx
				String company_name = resultMap2.get("company_name"); //기업회원 닉네임
				
				session.setAttribute("company_idx", company_idx); //기업회원 idx 추가
				session.setAttribute("company_name", company_name); //기업회원 이름 추가
				return "home";
			}
		}
		return "test/testlogin";
	}
	
	// 소개페이지
	@GetMapping("/culture_page.do")
	public String culture_page() {
		
		return "culture_page";
	}

}