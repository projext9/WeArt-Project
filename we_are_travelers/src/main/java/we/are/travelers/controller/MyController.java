package we.are.travelers.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import we.are.travelers.service.MyService;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;

@Controller
public class MyController {

	private MyService myService;
	
	@Autowired
	public MyController(MyService myService) {
		this.myService = myService;
	}
	
	@GetMapping("/info.do")
	public String info(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String member_idx = (String) session.getAttribute("member_idx");
		
		List<MemberVo> info = myService.getInfo(member_idx);
		model.addAttribute("info", info);
		return "myPage/info";
	}
	
	@GetMapping("/info_check.do")
	public String info_check() {
		return "myPage/info_check";
	}
	
	@PostMapping("/info_checkPwd.do")
	public String info_checkPwd(MemberVo mv, HttpServletRequest request,
			@RequestParam(value="member_pwd") String member_pwd) {
		
		HttpSession session = request.getSession();
		
		mv.setMember_idx((String) session.getAttribute("member_idx"));
		mv.setMember_pwd(member_pwd);
		
		int result = myService.info_checkPwd(mv);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/info.do";
		}else {
			viewPage = "info_check.do";
		}return viewPage;
	}
	
	@ResponseBody	//
	@GetMapping("/modify_info.do")
	public int modify_info(MemberVo memberVo,
			@RequestParam(value="member_idx") String member_idx,
			@RequestParam(value="member_name") String member_name,
			@RequestParam(value="member_pwd") String member_pwd,
			@RequestParam(value="member_nick") String member_nick,
			@RequestParam(value="member_phone") String member_phone,
			@RequestParam(value="member_delyn") char member_delyn) {
		
		memberVo.setMember_idx(member_idx);
		memberVo.setMember_name(member_name);
		memberVo.setMember_pwd(member_pwd);
		memberVo.setMember_nick(member_nick);
		memberVo.setMember_phone(member_phone);
		memberVo.setMember_delyn(member_delyn);
		
		System.out.println("member_pwd : "+member_pwd);
		
		int result = myService.modify_info(memberVo);
		
		return result;
	}
	
	@GetMapping("/payment.do")
	public String payment(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String member_idx = (String) session.getAttribute("member_idx");
		
		List<OrderLastVo> payment = myService.getPayment(member_idx);
		model.addAttribute("payment", payment);
		return "myPage/payment";
	}
	
	@GetMapping("/paymentContent.do")
	public String paymentContent(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String orderLast_num = (String) session.getAttribute("orderLast_num");
		
		List<OrderVo> paymentContent = myService.getPaymentContent(orderLast_num);
		model.addAttribute("paymentContent", paymentContent);
		System.out.println(orderLast_num);
		System.out.println(model);
		return "myPage/paymentContent";
	}
	
	@GetMapping("/myNotice.do")
	public String myNotice(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String member_idx = (String) session.getAttribute("member_idx");
		
		List<BoardVo> myNotice = myService.getMyNotice(member_idx);
		model.addAttribute("myNotice", myNotice);
		return "myPage/myNotice";
	}
	
	@GetMapping("/myNoticeContent.do")
	public String myNoticeContent(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String board_subject = (String) session.getAttribute("board_subject");
		
		List<BoardVo> myNoticeContent = myService.getMyNoticeContent(board_subject);
		model.addAttribute("myNoticeContent", myNoticeContent);
		return "myPage/myNoticeContent";
	}
	
	
	
	
	
	
}