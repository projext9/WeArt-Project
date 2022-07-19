package we.are.travelers.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.travelers.service.AllMemberService;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.MemberVo;

@Controller
public class AllMemberController {

	
	private AllMemberService AllmemberService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AllMemberController(AllMemberService AllmemberService) {
		this.AllmemberService = AllmemberService;
	}
	
	@RequestMapping(value="/login.do" , method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
    @RequestMapping(value="/loginProcess.do" , method = RequestMethod.POST)
	public String loginProcess(@RequestParam("member_id") String member_id,
			 					@RequestParam("member_pwd") String member_pwd, 
			 					HttpServletRequest request) {

		//2개의 전달값을 HashMap객체에 저장해서 MyBatis 입력값으로 사용
		HashMap<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("member_id", member_id);
		loginInfo.put("member_pw", member_pwd);
		
		//2개의 결과값을 얻고자 HashMap 객체 사용
		HashMap<String, Long> resultMap=AllmemberService.login(loginInfo);
		long member_auth = resultMap.get("member_auth");//회원인증
		long member_grade = resultMap.get("member_grade");//회원등급
		
		String viewPage = null;
		if(member_auth==1) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);//회원인증 추가	
			session.setAttribute("member_grade", member_grade);//회원등급 추가
			viewPage = "redirect:/home.do";
		
		}else{
			viewPage = "member/login";
		}
		
		return viewPage;
	}
    //이용약관 상세 보기
    @RequestMapping(value="/WeArtTermsOfService.do", method = RequestMethod.GET)
	public String terms1() {
		return "member/agr_terms_of_service";
	}
    @RequestMapping(value="/WeArtPersnolInfo.do", method = RequestMethod.GET)
	public String terms2() {
		return "member/agr_persnol_info";
	}
    @RequestMapping(value="/WeArtMarketing.do", method = RequestMethod.GET)
	public String terms3() {
		return "member/agr_marketing";
	}
    
	//회원가입 로직
	@RequestMapping(value="/joinMember.do", method = RequestMethod.GET)
	public String join() {
		return "member/join_terms_of";
	}
	@RequestMapping(value="/joinNext.do", method = RequestMethod.GET)
	public String joinNext() {
		return "member/join_email";
	}
	@RequestMapping(value="/joinNext2.do", method = RequestMethod.POST)
	public String joinNext2(@RequestParam("email")String email , Model model) {
		
		
		model.addAttribute("email", email);
		
		return "member/join_pwd";
	}
	@RequestMapping(value="/joinNext3.do", method = RequestMethod.POST)
		public String joinNext3()  {		
		
		return "member/join_persnol_info";
	}
	@RequestMapping(value="/joinNextfinal.do", method = RequestMethod.GET)
	public String joinNext4() {
		return "member/join_finish";
	}
	@RequestMapping(value="/joinCompany.do", method = RequestMethod.GET)
	public String joinCompany() {
		return "company/join_company";
	}
	
	@RequestMapping(value="/joinMemberProcess.do" , method = RequestMethod.POST)
	public String joinMemberProcess(MemberVo memberVo) {
		//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		//이러한 객체를 커맨드 객체라고 함.
		int result=AllmemberService.joinMember(memberVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/join_finish.do";
		}else{
			viewPage = "member/join_member";
		}
		
		return viewPage;
	
}	
	@RequestMapping(value="/joinCompanyProcess.do" , method = RequestMethod.POST)
	public String joinCompanyProcess(CompanyVo companyVo) {
		//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		//이러한 객체를 커맨드 객체라고 함.
		int result=AllmemberService.joinCompany(companyVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/home.do";
		}else{
			viewPage = "member/join_member";
		}
		
		return viewPage;
	
}	
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/home.do";
	}

}

/*
 * @PostMapping("/loginProcess.do") public String loginProcess(MemberVo
 * memberVo, HttpServletRequest request) { //요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는
 * 경우 전달된 값을 그 객체에 매핑시켜줌 //이러한 객체를 커맨드 객체라고 함.
 * 
 * HashMap<String, Long> resultMap=memberService.login(memberVo); long
 * member_auth = resultMap.get("member_auth");//회원인증 long member_grade =
 * resultMap.get("member_grade");//회원등급
 * 
 * String viewPage = null; if(member_auth==1) { HttpSession session =
 * request.getSession(); session.setAttribute("member_id",
 * memberVo.getMember_id());//회원인증 추가 session.setAttribute("member_grade",
 * member_grade);//회원등급 추가 viewPage = "redirect:/home.do";
 * 
 * }else{ viewPage = "member/login"; }
 * 
 * return viewPage; }
 */
