package we.are.travelers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import we.are.travelers.service.AjaxService;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

@RestController //Spring4버전부터 지원. @Controller + @ResponseBody 기능
public class AjaxController {
	
	private AjaxService ajaxService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AjaxController(AjaxService ajaxService) {
		this.ajaxService = ajaxService;
	}
	
	@PostMapping("/checkId.do")
	//@ResponseBody //Ajax통신의 응답내용을 보내는 것을 표시
	public String checkId(@RequestParam("member_id") String id) {
		
		System.out.println("id: "+id);
		
		String result="N";//중복된 아이디 없음
		
		int flag = ajaxService.checkId(id);
		
		if(flag == 1) result = "Y";//중복된 아이디 있음
		
		return result;
	}
	
	/*이메일 인증 */
	@RequestMapping(value="/mailCheck" , method=RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String member_id) throws Exception{
	/*view 로부터 넘어온 데이터 확인	*/
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 : " + member_id);
		
	}
	
	
}
