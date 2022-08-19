package we.are.travelers.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShowController {
	
	@GetMapping("/showculture01.do") //문화 소개 서울
	public String showculture01(HttpServletRequest request) {
		return "show/showculture01";
	}
	
	@GetMapping("/showculture02.do") //문화 소개 인천
	public String showculture02(HttpServletRequest request) {
		return "show/showculture02";
	}

	@GetMapping("/showculture03.do") //문화 소개 대전
	public String showculture03(HttpServletRequest request) {
		return "show/showculture03";
	}
	
	@GetMapping("/showculture04.do") //문화 소개 울산
	public String showculture04(HttpServletRequest request) {
		return "show/showculture04";
	}

	@GetMapping("/showculture05.do") //문화 소개 대구
	public String showculture05(HttpServletRequest request) {
		return "show/showculture05";
	}
	
	@GetMapping("/showculture06.do") //문화 소개 부산
	public String showculture06(HttpServletRequest request) {
		return "show/showculture06";
	}

	@GetMapping("/showculture07.do") //문화 소개 광주
	public String showculture07(HttpServletRequest request) {
		return "show/showculture07";
	}
	
	@GetMapping("/showculture08.do") //문화 소개 경기도
	public String showculture08(HttpServletRequest request) {
		return "show/showculture08";
	}
	
	@GetMapping("/showculture09.do") //문화 소개 강원도
	public String showculture09(HttpServletRequest request) {
		return "show/showculture09";
	}

	@GetMapping("/showculture10.do") //문화 소개 충청.세종
	public String showculture10(HttpServletRequest request) {
		return "show/showculture10";
	}

	@GetMapping("/showculture11.do") //문화 소개 경상도
	public String showculture11(HttpServletRequest request) {
		return "show/showculture11";
	}
	
	@GetMapping("/showculture12.do") //문화 소개 전라도
	public String showculture12(HttpServletRequest request) {
		return "show/showculture12";
	}
	
	@GetMapping("/showculture13.do") //문화 소개 제주도
	public String showculture13(HttpServletRequest request) {
		return "show/showculture13";
	}
	
	@GetMapping("/showactivity01.do") //문화 소개 서울
	public String showactivity01(HttpServletRequest request) {
		return "show/showactivity01";
	}
	
	@GetMapping("/showactivity02.do") //문화 소개 인천
	public String showactivity02(HttpServletRequest request) {
		return "show/showactivity02";
	}

	@GetMapping("/showactivity03.do") //문화 소개 대전
	public String showactivity03(HttpServletRequest request) {
		return "show/showactivity03";
	}
	
	@GetMapping("/showactivity04.do") //문화 소개 울산
	public String showactivity04(HttpServletRequest request) {
		return "show/showactivity04";
	}

	@GetMapping("/showactivity05.do") //문화 소개 대구
	public String showactivity05(HttpServletRequest request) {
		return "show/showactivity05";
	}
	
	@GetMapping("/showactivity06.do") //문화 소개 부산
	public String showactivity06(HttpServletRequest request) {
		return "show/showactivity06";
	}

	@GetMapping("/showactivity07.do") //문화 소개 광주
	public String showactivity07(HttpServletRequest request) {
		return "show/showactivity07";
	}
	
	@GetMapping("/showactivity08.do") //문화 소개 경기도
	public String showactivity08(HttpServletRequest request) {
		return "show/showactivity08";
	}
	
	@GetMapping("/showactivity09.do") //문화 소개 강원도
	public String showactivity09(HttpServletRequest request) {
		return "show/showactivity09";
	}

	@GetMapping("/showactivity10.do") //문화 소개 충청.세종
	public String showactivity10(HttpServletRequest request) {
		return "show/showactivity10";
	}

	@GetMapping("/showactivity11.do") //문화 소개 경상도
	public String showactivity11(HttpServletRequest request) {
		return "show/showactivity11";
	}
	
	@GetMapping("/showactivity12.do") //문화 소개 전라도
	public String showactivity12(HttpServletRequest request) {
		return "show/showactivity12";
	}
	
	@GetMapping("/showactivity13.do") //문화 소개 제주도
	public String showactivity13(HttpServletRequest request) {
		return "show/showactivity13";
	}
}