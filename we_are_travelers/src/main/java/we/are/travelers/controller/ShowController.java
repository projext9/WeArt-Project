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
	
	@GetMapping("/showactivity01.do") //액티비티 소개 서울
	public String showactivity01(HttpServletRequest request) {
		return "show/showactivity01";
	}
	
	@GetMapping("/showactivity02.do") //액티비티 소개 인천
	public String showactivity02(HttpServletRequest request) {
		return "show/showactivity02";
	}

	@GetMapping("/showactivity03.do") //액티비티 소개 대전
	public String showactivity03(HttpServletRequest request) {
		return "show/showactivity03";
	}
	
	@GetMapping("/showactivity04.do") //액티비티 소개 울산
	public String showactivity04(HttpServletRequest request) {
		return "show/showactivity04";
	}

	@GetMapping("/showactivity05.do") //액티비티 소개 대구
	public String showactivity05(HttpServletRequest request) {
		return "show/showactivity05";
	}
	
	@GetMapping("/showactivity06.do") //액티비티 소개 부산
	public String showactivity06(HttpServletRequest request) {
		return "show/showactivity06";
	}

	@GetMapping("/showactivity07.do") //액티비티 소개 광주
	public String showactivity07(HttpServletRequest request) {
		return "show/showactivity07";
	}
	
	@GetMapping("/showactivity08.do") //액티비티 소개 경기도
	public String showactivity08(HttpServletRequest request) {
		return "show/showactivity08";
	}
	
	@GetMapping("/showactivity09.do") //액티비티 소개 강원도
	public String showactivity09(HttpServletRequest request) {
		return "show/showactivity09";
	}

	@GetMapping("/showactivity10.do") //액티비티 소개 충청.세종
	public String showactivity10(HttpServletRequest request) {
		return "show/showactivity10";
	}

	@GetMapping("/showactivity11.do") //액티비티 소개 경상도
	public String showactivity11(HttpServletRequest request) {
		return "show/showactivity11";
	}
	
	@GetMapping("/showactivity12.do") //액티비티 소개 전라도
	public String showactivity12(HttpServletRequest request) {
		return "show/showactivity12";
	}
	
	@GetMapping("/showactivity13.do") //액티비티 소개 제주도
	public String showactivity13(HttpServletRequest request) {
		return "show/showactivity13";
	}
	
	@GetMapping("/showfishing01.do") //낚시 소개 서울
	public String showfishing01(HttpServletRequest request) {
		return "show/showfishing01";
	}
	
	@GetMapping("/showfishing02.do") //낚시 소개 인천
	public String showfishing02(HttpServletRequest request) {
		return "show/showfishing02";
	}

	@GetMapping("/showfishing03.do") //낚시 소개 대전
	public String showfishing03(HttpServletRequest request) {
		return "show/showfishing03";
	}
	
	@GetMapping("/showfishing04.do") //낚시 소개 울산
	public String showfishing04(HttpServletRequest request) {
		return "show/showfishing04";
	}

	@GetMapping("/showfishing05.do") //낚시 소개 대구
	public String showfishing05(HttpServletRequest request) {
		return "show/showfishing05";
	}
	
	@GetMapping("/showfishing06.do") //낚시 소개 부산
	public String showfishing06(HttpServletRequest request) {
		return "show/showfishing06";
	}

	@GetMapping("/showfishing07.do") //낚시 소개 광주
	public String showfishing07(HttpServletRequest request) {
		return "show/showfishing07";
	}
	
	@GetMapping("/showfishing08.do") //낚시 소개 경기도
	public String showfishing08(HttpServletRequest request) {
		return "show/showfishing08";
	}
	
	@GetMapping("/showfishing09.do") //낚시 소개 강원도
	public String showfishing09(HttpServletRequest request) {
		return "show/showfishing09";
	}

	@GetMapping("/showfishing10.do") //낚시 소개 충청.세종
	public String showfishing10(HttpServletRequest request) {
		return "show/showfishing10";
	}

	@GetMapping("/showfishing11.do") //낚시 소개 경상도
	public String showfishing11(HttpServletRequest request) {
		return "show/showfishing11";
	}
	
	@GetMapping("/showfishing12.do") //낚시 소개 전라도
	public String showfishing12(HttpServletRequest request) {
		return "show/showfishing12";
	}
	
	@GetMapping("/showfishing13.do") //낚시 소개 제주도
	public String showfishing13(HttpServletRequest request) {
		return "show/showfishing13";
	}

	@GetMapping("/showcamping01.do") //캠핑 소개 서울
	public String showcamping01(HttpServletRequest request) {
		return "show/showcamping01";
	}
	
	@GetMapping("/showcamping02.do") //캠핑 소개 인천
	public String showcamping02(HttpServletRequest request) {
		return "show/showcamping02";
	}

	@GetMapping("/showcamping03.do") //캠핑 소개 대전
	public String showcamping03(HttpServletRequest request) {
		return "show/showcamping03";
	}
	
	@GetMapping("/showcamping04.do") //캠핑 소개 울산
	public String showcamping04(HttpServletRequest request) {
		return "show/showcamping04";
	}

	@GetMapping("/showcamping05.do") //캠핑 소개 대구
	public String showcamping05(HttpServletRequest request) {
		return "show/showcamping05";
	}
	
	@GetMapping("/showcamping06.do") //캠핑 소개 부산
	public String showcamping06(HttpServletRequest request) {
		return "show/showcamping06";
	}

	@GetMapping("/showcamping07.do") //캠핑 소개 광주
	public String showcamping07(HttpServletRequest request) {
		return "show/showcamping07";
	}
	
	@GetMapping("/showcamping08.do") //캠핑 소개 경기도
	public String showcamping08(HttpServletRequest request) {
		return "show/showcamping08";
	}
	
	@GetMapping("/showcamping09.do") //캠핑 소개 강원도
	public String showcamping09(HttpServletRequest request) {
		return "show/showcamping09";
	}

	@GetMapping("/showcamping10.do") //캠핑 소개 충청.세종
	public String showcamping10(HttpServletRequest request) {
		return "show/showcamping10";
	}

	@GetMapping("/showcamping11.do") //캠핑 소개 경상도
	public String showcamping11(HttpServletRequest request) {
		return "show/showcamping11";
	}
	
	@GetMapping("/showcamping12.do") //캠핑 소개 전라도
	public String showcamping12(HttpServletRequest request) {
		return "show/showcamping12";
	}
	
	@GetMapping("/showcamping13.do") //캠핑 소개 제주도
	public String showcamping13(HttpServletRequest request) {
		return "show/showcamping13";
	}

	@GetMapping("/showstaying01.do") //숙박 소개 서울
	public String showstaying01(HttpServletRequest request) {
		return "show/showstaying01";
	}
	
	@GetMapping("/showstaying02.do") //숙박 소개 인천
	public String showstaying02(HttpServletRequest request) {
		return "show/showstaying02";
	}

	@GetMapping("/showstaying03.do") //숙박 소개 대전
	public String showstaying03(HttpServletRequest request) {
		return "show/showstaying03";
	}
	
	@GetMapping("/showstaying04.do") //숙박 소개 울산
	public String showstaying04(HttpServletRequest request) {
		return "show/showstaying04";
	}

	@GetMapping("/showstaying05.do") //숙박 소개 대구
	public String showstaying05(HttpServletRequest request) {
		return "show/showstaying05";
	}
	
	@GetMapping("/showstaying06.do") //숙박 소개 부산
	public String showstaying06(HttpServletRequest request) {
		return "show/showstaying06";
	}

	@GetMapping("/showstaying07.do") //숙박 소개 광주
	public String showstaying07(HttpServletRequest request) {
		return "show/showstaying07";
	}
	
	@GetMapping("/showstaying08.do") //숙박 소개 경기도
	public String showstaying08(HttpServletRequest request) {
		return "show/showstaying08";
	}
	
	@GetMapping("/showstaying09.do") //숙박 소개 강원도
	public String showstaying09(HttpServletRequest request) {
		return "show/showstaying09";
	}

	@GetMapping("/showstaying10.do") //숙박 소개 충청.세종
	public String showstaying10(HttpServletRequest request) {
		return "show/showstaying10";
	}

	@GetMapping("/showstaying11.do") //숙박 소개 경상도
	public String showstaying11(HttpServletRequest request) {
		return "show/showstaying11";
	}
	
	@GetMapping("/showstaying12.do") //숙박 소개 전라도
	public String showstaying12(HttpServletRequest request) {
		return "show/showstaying12";
	}
	
	@GetMapping("/showstaying13.do") //숙박 소개 제주도
	public String showstaying13(HttpServletRequest request) {
		return "show/showstaying13";
	}

}