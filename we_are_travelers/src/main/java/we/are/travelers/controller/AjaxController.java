package we.are.travelers.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import we.are.travelers.service.AjaxService;

//Ajax통신 지원을 위해 pom.xml에 의존모듈(jackson)을 추가해 줌

//@Controller
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
	
	
	@PostMapping("/adminUpdateInfo.do")
	public String adminUpdateInfo(@RequestParam("member_idx") int member_idx,
			@RequestParam("member_grade") int member_grade) {
		
		//웹브라우저에서 전달받은 2개의 값을 MyBatis의 입력값으로 사용하기 위해 HashMap객체 생성해서 저장
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_idx", member_idx);
		map.put("member_grade", member_grade);
				
		String result="N";//정보수정 실패
		
		int flag = ajaxService.updateMemberGrade(map);
		
		if(flag == 1) result = "Y";//정보수정 성공
		
		return result;
	}
	
	
	@PostMapping("/adminDeleteInfo.do")
	public String adminDeleteInfo(@RequestParam("member_idx_arr[]") List<Integer> member_idx_list) {
		
		String result="N";//회원삭제 실패
		
		int flag = ajaxService.deleteMemberInfo(member_idx_list);
		
		if(flag != 0) result = "Y";//회원삭제 성공
		
		return result;
	}
	

	
	
}

