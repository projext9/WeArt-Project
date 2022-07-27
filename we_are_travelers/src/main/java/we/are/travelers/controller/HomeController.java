package we.are.travelers.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")//get방식 요청 처리
	public String home() {
		return "home";
	}
	
	@GetMapping("/home.do")//get방식 요청 처리
	public String home2() {
		return "home";
	}


	
}
