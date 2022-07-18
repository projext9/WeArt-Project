package we.are.travelers.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
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

import we.are.travelers.service.ItemService;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OptionVo;

@Controller
public class ItemController {
	
	private ItemService itemService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}

	@GetMapping("/itempay.do")
	public String itempay() {
		return "item/itempay";
	}
	
	@GetMapping("/fishingshop.do") //낚시 상품페이지 호출
	public String fishingshop(Model model) {
		
		List<ItemVo> fishingShopList = itemService.getItemList();
		model.addAttribute("fishingShopList", fishingShopList);
		
		return "item/fishingshop";
	}
	
	@GetMapping("/itemdetail.do") //상품 상세페이지 호출
	public String itemdetail(Model model, HttpServletRequest request) {
		String item_idx = request.getParameter("iidx");
		int item_idx_ = Integer.parseInt(item_idx);
		
		ItemVo itemVo = itemService.getItemDetail(item_idx_);
		model.addAttribute("itemVo", itemVo);
		
		List<OptionVo> optionList = itemService.getItemOption(item_idx_);
		model.addAttribute("optionList", optionList);

		return "item/itemdetail";
	}

	@PostMapping("/itemcartadd.do") //카트 상품담기
	@ResponseBody
	public String itemcartadd(HttpServletRequest request, @RequestParam("optionValue") int option_idx, @RequestParam("pieceValue") int cart_count) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		String result = "N"; //장바구니 담기 실패

		if (member_idx == null) {
			result = "L"; //로그인 필요
			return result;
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("option_idx", option_idx);
			map.put("cart_count", cart_count);

			int flag = itemService.addItemCart(map);
			if(flag == 1) result = "Y"; //장바구니 담기 성공

			return result;
		}
	}

	@GetMapping("/itemcart.do") //카트 페이지
	public String itemcart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");

		if (member_idx == null) {
			return "home"; //로그인 필요

		} else {
			List<Map<String, Object>> map = itemService.getCartList(member_idx);

			model.addAttribute("CartListMap", map);

			return "item/itemcart";
		}
	}
	
	@PostMapping("/itemorder.do")
	public String itemorder(HttpServletRequest request, Model model) {
		String[] cart_idx_list = request.getParameterValues("cart_idx");
		List<String> cart_idx_list_ = Arrays.asList(cart_idx_list);	
		
		System.out.println("아이템 컨트롤러 - 선택된 cart_idx 값" + cart_idx_list_);
		
		List<Map<String, Object>> map = itemService.getItemOrder(cart_idx_list_);
		
		model.addAttribute("ItemOrderMap", map);
		System.out.println("아이템 컨트롤러 - map : " + map);

		return "item/itemorder";
	}
		
		    



	
	
//	@PostMapping("/itemorder.do")
//	public String itemorder(HttpServletRequest request, Model model) {
//		String[] chkBox = request.getParameterValues("cart_idx");
//		
//		String cart_idx_list = "";
//		
//		for(int i = 0; i <= chkBox.length-1; i++){
//			cart_idx_list = cart_idx_list+","+"'"+chkBox[i]+"'";
//			System.out.println("아이템 컨트롤러 - "+ cart_idx_list);
//		}
//		cart_idx_list = cart_idx_list.substring(1);
//		System.out.println("아이템 컨트롤러 - 최종 : " + cart_idx_list);
//		List<Map<String, Object>> map = itemService.getItemOrder(cart_idx_list);
//		System.out.println("아이템 컨트롤러 - " + map);
//		model.addAttribute("ItemOrderMap", map);
//
//		System.out.println("아이템 컨트롤러 - " + "카트 선택 맵 담기");
//		
//		return "item/itemorder";}


}

