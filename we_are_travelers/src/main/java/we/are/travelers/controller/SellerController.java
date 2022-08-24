package we.are.travelers.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import we.are.travelers.service.MyService;
import we.are.travelers.service.SellerService;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.PageMaker;
import we.are.travelers.vo.SearchCriteria;

@Controller
public class SellerController {

	private SellerService sellerService;
	
	@Autowired
	public SellerController(SellerService sellerService) {
		this.sellerService = sellerService;
	}
	
	@GetMapping("/sellerinfo.do")
	public String sellerinfo(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String company_idx = (String) session.getAttribute("company_idx");
		
		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			CompanyVo companyVo = sellerService.getInfo(company_idx); //기업정보 호출
			model.addAttribute("companyVo", companyVo);
			return "seller/sellerinfo";
		}
	}
	
	@GetMapping("/itemManage.do")
	public String itemManage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String company_idx = (String) session.getAttribute("company_idx");
		
		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			List<ItemVo> itemVoList = sellerService.getItemlist(company_idx); //아이템 리스트
			model.addAttribute("itemVoList", itemVoList);
			return "seller/itemManage";
		}
	}
	
	@GetMapping("/sendManage.do")
	public String sendManage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String company_idx = (String) session.getAttribute("company_idx");
		
		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			List<Map<String, Object>> map = sellerService.getItemOrder(company_idx);
			model.addAttribute("ItemOrderMap", map);

			return "seller/sendManage";
		}
	}
	
}