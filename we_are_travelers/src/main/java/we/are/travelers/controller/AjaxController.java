package we.are.travelers.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;


import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import we.are.travelers.service.AjaxService;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
		
	private AjaxService ajaxService;
	
	@Autowired
    private JavaMailSender mailSender;

	@Autowired //자동 의존 주입: 생성자 방식
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	@RequestMapping("/checkId.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkId(@RequestParam("member_id") String id) {
		
		System.out.println("id: "+id);
		
		String id_check_result="N";//중복된 아이디 없음
		
		int flag = ajaxService.checkId(id);
		
		if(flag == 1) id_check_result = "Y";//중복된 아이디 있음
		
		return id_check_result;
	}
	
	@RequestMapping("/checkComId.do")
	public String checkComId(@RequestParam("company_id") String id) {
		
		System.out.println("id: "+id);
		
		String id_check_result="N";//중복된 아이디 없음
		
		int flag = ajaxService.checkComId(id);
		
		if(flag == 1) id_check_result = "Y";    //중복된 아이디 있음
		
		return id_check_result;
	}
	
	@RequestMapping("/checkComName.do")
	public String checkComName(@RequestParam("company_name") String name) {
		
		System.out.println("name: "+name);
		
		String name_check_result="N";//등록된 업체 없음
		
		int flag = ajaxService.checkComName(name);
		
		if(flag == 1) name_check_result = "Y";    //중복된 아이디 있음
		
		return name_check_result;
	}
	
	@RequestMapping("/checkNick.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkNick(@RequestParam("member_nick") String nick) {
		
		System.out.println("ncik: "+nick);
		
		String nick_check_result="N";//중복된 아이디 없음
		
		int flag = ajaxService.checkNick(nick);
		
		if(flag == 1) nick_check_result = "Y";//중복된 아이디 있음
		
		return nick_check_result;
	}
	
	 /* 이메일 인증 */
	 @RequestMapping(value="/mailCheck" , method=RequestMethod.GET)
	    public String mailCheckGET(@RequestParam("email")String email) throws Exception{
	        
	        /* 뷰(View)로부터 넘어온 데이터 확인 */
	        System.out.println("이메일 데이터 전송 확인");
	        System.out.println("이메일 : " + email);
	        
	        /* 인증번호(난수) 생성 */
	        Random random = new Random();
	        int checkNum = random.nextInt(888888) + 111111;
	        System.out.println("인증번호 " + checkNum);
	        
	        /* 이메일 보내기 */
	        String setFrom = "seokcheol005@gmail.com";
	        String toMail = email;
	        String title = "WeArt 회원가입 인증 이메일 입니다.";
	        String content = 
	                "WeAreTravelers 가입을 환영합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	       
	       try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	       String num = Integer.toString(checkNum);
	       
	       return num;
    }
	
}
