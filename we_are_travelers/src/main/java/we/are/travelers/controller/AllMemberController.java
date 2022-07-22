package we.are.travelers.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	///////////////////////로그인 로직
    @RequestMapping(value="/loginProcess.do" , method = RequestMethod.POST)
	public String loginProcess (MemberVo mv , CompanyVo cv , HttpServletRequest request , HttpServletRequest request1) {
    	String viewPage = null;
    	
	MemberVo member_grade=AllmemberService.loginMember(mv);
		if(member_grade != null) {
			HttpSession session = request.getSession();
			session.setAttribute("list", AllmemberService.loginMember(mv));
			session.setAttribute("member_grade", mv.getMember_grade());//회원등급 추가
			session.setAttribute("member_nick",mv.getMember_nick());//회원닉네임

	        viewPage = "redirect:/home.do";
	        
	CompanyVo company_auth=AllmemberService.loginCompany(cv);     
	     if(company_auth == null) {
	    	 HttpSession session1 = request1.getSession();
	    	 session1.setAttribute("company_name",cv.getCompany_name());//회사이름
	    	 session1.setAttribute("company_auth",cv.getCompany_name());//회사인증
	    	 
	    	 viewPage = "redirect:/home.do";
	     }
		}else{
			viewPage = "member/login";
		}
		
		return viewPage;
	}
    /////////////////////////////////이용약관 상세 보기
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
    
	///////////////////////////////////회원가입 로직
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
		public String joinNext3(@RequestParam("email")String email , @RequestParam("pwd")String pwd , Model model)  {		
		
		model.addAttribute("email", email);
		model.addAttribute("pwd", pwd);
		
		return "member/join_persnol_info";
	}
	@RequestMapping(value="/joinfinish.do", method = RequestMethod.POST)
	public String joinNext4(@RequestParam("email")String email , @RequestParam("pwd")String pwd , @RequestParam("nick") String nick
			, @RequestParam("name") String name , @RequestParam("birth") String birth, Model model) {
		
		model.addAttribute("email", email);
		model.addAttribute("pwd", pwd);
		model.addAttribute("nick", nick);
		model.addAttribute("name", name);
		model.addAttribute("birth", birth);
		
		
	  return "member/join_finish";
    }
		@RequestMapping("/fileUploadProcess.do")
		public String fileUploadProcess(@RequestParam("uploadFile") MultipartFile uploadFile,
				MemberVo memberVo, Model model, HttpServletRequest request) throws IllegalStateException, IOException{
			//<input type ="file" name="uploadFile" />에서 업로드된 파일객체를 MultipartFile uploadFile에 저장
			
			//업로드된 파일을 프로젝트 내의 upload 폴더에 저장하기 전에 DB의 upload_file 테이블에 저장할 
			//origin_filename과 system_filename 값을 세팅함
			
			String origin_fileName = uploadFile.getOriginalFilename();
			
			//시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
			int dot_idx = origin_fileName.lastIndexOf(".");
			String fileName1 = origin_fileName.substring(0, dot_idx);
			String extension = origin_fileName.substring(dot_idx+1);
			String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
			String system_fileName = fileName2+"."+extension;
			
			//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
			String upload_dir = "resources/upload/";
			
			String realPath = request.getServletContext().getRealPath(upload_dir);
			System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
			
			//지정된 경로에 파일 저장
			//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
			String fullPath = realPath+system_fileName;
			uploadFile.transferTo(new File(fullPath));
			
			
			//파일업로드가 정상적으로 이루어진 것을 gallery_home.jsp에서 확인
			//model객체에 입력내용(content)와 system_fileName을 추가함
			//model.addAttribute("content", content);
			//model.addAttribute("fileName", system_fileName);
			
			//파일 업로드 디렉토리에 저장된 모든 파일이름을 가져와서 model객체에 추가
			/*File[] files = new File(realPath).listFiles();
			String[] fileNames = new String[files.length];
			
			for(int i=0; i<files.length; i++) {
				fileNames[i] = files[i].getName();
			}*/
			
			String[] fileNames = new File(realPath).list();
			model.addAttribute("fileNames", fileNames);
			
			
			return "gallery/gallery_home";
		}
		

	
	//////////////////////////////////////기업회원 회원가입 및 약관동의 상세보기
	@RequestMapping(value="/joinCompany.do", method = RequestMethod.GET)
	public String joinCompany() {
		return "company/join_c_terms_of";
	}
	 //이용약관 상세 보기
    @RequestMapping(value="/c_WeArtTermsOfService.do", method = RequestMethod.GET)
	public String termsC1() {
		return "company/agr_c_terms_of_service";
	}
    @RequestMapping(value="/c_WeArtPersnolInfo.do", method = RequestMethod.GET)
	public String termsC2() {
		return "company/agr_c_persnol_info";
	}
    @RequestMapping(value="/c_WeArtPersnolInfo_other.do", method = RequestMethod.GET)
	public String termsC3() {
		return "company/agr_c_persnol_info_other";
	}
    @RequestMapping(value="/c_WeArtMarketing.do", method = RequestMethod.GET)
	public String termsC4() {
		return "company/agr_c_marketing";
	}
    
    @RequestMapping(value="/joinCnext.do", method = RequestMethod.GET)
	public String joinCNext() {
		return "company/join_c_buisNumber";
	}
	@RequestMapping(value="/joinCnext2.do", method = RequestMethod.POST)
	public String joinCNext2(@RequestParam("buisNum")String buisNum , Model model) {
		
		model.addAttribute("buisNum", buisNum);
		
		return "company/join_c_email";
	}
	@RequestMapping(value="/joinCnext3.do", method = RequestMethod.POST)
		public String joinCNext3(@RequestParam("buisNum")String buisNum , @RequestParam("c_email")String c_email , Model model)  {		
		
		model.addAttribute("buisNum", buisNum);
		model.addAttribute("c_email", c_email);
		
		return "member/join_persnol_info";
	}
	@RequestMapping(value="/joinCfinish.do", method = RequestMethod.POST)
	public String joinCNext4(@RequestParam("buisNum")String buisNum , @RequestParam("c_email")String c_email , @RequestParam("c_name") String c_name,
			@RequestParam("ceo") String ceo , @RequestParam("c_address") String c_address , Model model) {
		
		model.addAttribute("buisNum", buisNum);
		model.addAttribute("c_email", c_email);
		model.addAttribute("c_name", c_name );
		model.addAttribute("ceo", ceo);
		model.addAttribute("name", c_address);
		
		
		return "member/join_finish";
	}
	//회원가입 완료 로직
	@RequestMapping(value="/joinMemberProcess.do" , method = RequestMethod.POST)
	public String joinMemberProcess(MemberVo memberVo) {
		//요청매핑이 있는 메소드의 매개변수에 Vo나 자바클래스가 있는 경우 전달된 값을 그 객체에 매핑시켜줌
		//이러한 객체를 커맨드 객체라고 함.
		int result=AllmemberService.joinMember(memberVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/login.do";
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
			viewPage = "redirect:/login.do";
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
