package we.are.travelers.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShowController {
	
	@GetMapping("/showculture1.do") //문화 소개 서울
	public String showculture1(HttpServletRequest request) {
		return "show/showculture1";
	}
	
	@GetMapping("/showculture2.do") //문화 소개 인천
	public String showculture2(HttpServletRequest request) {
		return "show/showculture2";
	}

	@GetMapping("/showculture3.do") //문화 소개 대전
	public String showculture3(HttpServletRequest request) {
		return "show/showculture3";
	}
	
	@GetMapping("/showculture4.do") //문화 소개 울산
	public String showculture4(HttpServletRequest request) {
		return "show/showculture4";
	}

	@GetMapping("/showculture5.do") //문화 소개 대구
	public String showculture5(HttpServletRequest request) {
		return "show/showculture5";
	}
	
	@GetMapping("/showculture6.do") //문화 소개 부산
	public String showculture6(HttpServletRequest request) {
		return "show/showculture6";
	}

	@GetMapping("/showculture7.do") //문화 소개 광주
	public String showculture7(HttpServletRequest request) {
		return "show/showculture7";
	}
	
	@GetMapping("/showculture8.do") //문화 소개 경기도
	public String showculture8(HttpServletRequest request) {
		return "show/showculture8";
	}
	
	@GetMapping("/showculture9.do") //문화 소개 강원도
	public String showculture9(HttpServletRequest request) {
		return "show/showculture9";
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
	
	@GetMapping("/showactivity1.do") //문화 소개 서울
	public String showactivity1(HttpServletRequest request) {
		return "show/showactivity1";
	}
	
	@GetMapping("/showactivity2.do") //문화 소개 인천
	public String showactivity2(HttpServletRequest request) {
		return "show/showactivity2";
	}

	@GetMapping("/showactivity3.do") //문화 소개 대전
	public String showactivity3(HttpServletRequest request) {
		return "show/showactivity3";
	}
	
	@GetMapping("/showactivity4.do") //문화 소개 울산
	public String showactivity4(HttpServletRequest request) {
		return "show/showactivity4";
	}

	@GetMapping("/showactivity5.do") //문화 소개 대구
	public String showactivity5(HttpServletRequest request) {
		return "show/showactivity5";
	}
	
	@GetMapping("/showactivity6.do") //문화 소개 부산
	public String showactivity6(HttpServletRequest request) {
		return "show/showactivity6";
	}

	@GetMapping("/showactivity7.do") //문화 소개 광주
	public String showactivity7(HttpServletRequest request) {
		return "show/showactivity7";
	}
	
	@GetMapping("/showactivity8.do") //문화 소개 경기도
	public String showactivity8(HttpServletRequest request) {
		return "show/showactivity8";
	}
	
	@GetMapping("/showactivity9.do") //문화 소개 강원도
	public String showactivity9(HttpServletRequest request) {
		return "show/showactivity9";
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