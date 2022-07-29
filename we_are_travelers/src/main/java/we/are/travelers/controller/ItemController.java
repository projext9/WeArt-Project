
package we.are.travelers.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import we.are.travelers.service.ItemService;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OptionVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;

@Controller
public class ItemController {
	
	private ItemService itemService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
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
	
	@PostMapping("/itemorder.do") //배송지 입력 페이지
	public String itemorder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");

		if (member_idx == null) {
			return "home"; //로그인 필요

		} else {
			String total_itemPrice = request.getParameter("hidden_itemPrice");
			String total_postPrice = request.getParameter("hidden_postPrice");
			String total_price = request.getParameter("hidden_price");
			
			String[] cart_idx_list = request.getParameterValues("cart_idx");
			List<String> cart_idx_list_ = Arrays.asList(cart_idx_list);	
			List<Map<String, Object>> map1 = itemService.getItemOrder(cart_idx_list_);
			model.addAttribute("ItemOrderMap", map1);
			
			Map<String, Object> map2 = itemService.getMemberDetail(member_idx);
			model.addAttribute("map2", map2);

			request.setAttribute("total_itemPrice", total_itemPrice);
			request.setAttribute("total_postPrice", total_postPrice);
			request.setAttribute("total_price", total_price);

			return "item/itemorder";
		}
	}

	@PostMapping("/itemorderadd.do") //주문서 생성
	@ResponseBody
	public String itemorderadd(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
	    	
		if (member_idx == null) {
			return "home"; //로그인 필요

		} else {
			itemService.deleteAllOrder(member_idx); //찌꺼기 제거
			itemService.deleteAllOrderLast(member_idx); //찌꺼기 제거
			
			LocalDate now = LocalDate.now(); //현재 날짜
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd"); //포맷 정의
			String formatedNow = now.format(formatter); //포맷 적용
			
			String num = "";
		    for (int i = 1; i <= 8; i++) {
		        char ch = (char) ((Math.random() * 10) + 48);
		        num = num + String.valueOf(ch);
		    }
			
			String orderLast_num = formatedNow+num;
			
			String[] cart_idx_list = request.getParameterValues("cart_idx");
			int length = cart_idx_list.length;
			
			String orderLast_name = request.getParameter("orderLast_name");
			String orderLast_phone = request.getParameter("orderLast_phone");
			String orderLast_address = request.getParameter("orderLast_address");
			String orderLast_msg = request.getParameter("orderLast_msg");
			String orderLast_cashReceipt = request.getParameter("orderLast_cashReceipt");
			int orderLast_itemPrice = 0;
			int orderLast_postPrice = 0;
			int orderLast_totalPrice = 0;

			for(int i = 0; i < length; i++) {
				String cart_idx = cart_idx_list[i];
				HashMap<String, Object> map1 = itemService.getItemSelected(cart_idx);
				int option_idx = (int)map1.get("option_idx");
				String company_idx = (String)map1.get("company_idx");
				String order_itemName = (String)map1.get("item_name");
				String order_optionName = (String)map1.get("option_name");
				int order_price = (int)map1.get("option_price");
				int order_count = (int)map1.get("cart_count");
				int order_postPrice = (int)map1.get("option_postPrice");
				int order_totalPrice = order_price*order_count;
				
				HashMap<String, Object> map2 = new HashMap<String, Object>();
				map2.put("member_idx", member_idx);
				map2.put("orderLast_num", orderLast_num);
				map2.put("option_idx", option_idx);
				map2.put("company_idx", company_idx);
				map2.put("order_itemName", order_itemName);
				map2.put("order_optionName", order_optionName);
				map2.put("order_price", order_price);
				map2.put("order_count", order_count);
				map2.put("order_postPrice", order_postPrice);
				map2.put("order_totalPrice", order_totalPrice);
				
				orderLast_itemPrice = orderLast_itemPrice+order_totalPrice;
				orderLast_postPrice = orderLast_postPrice+order_postPrice;
				orderLast_totalPrice = orderLast_totalPrice+order_postPrice+order_totalPrice;

				itemService.addOrderDetail(map2);
			}
			
			HashMap<String, Object> map3 = new HashMap<String, Object>();
			map3.put("member_idx", member_idx);
			map3.put("orderLast_num", orderLast_num);
			map3.put("orderLast_itemPrice", orderLast_itemPrice);
			map3.put("orderLast_postPrice", orderLast_postPrice);
			map3.put("orderLast_totalPrice", orderLast_totalPrice);
			map3.put("orderLast_name", orderLast_name);
			map3.put("orderLast_phone", orderLast_phone);
			map3.put("orderLast_address", orderLast_address);
			map3.put("orderLast_msg", orderLast_msg);
			map3.put("orderLast_cashReceipt", orderLast_cashReceipt);
			
			itemService.addOrderLast(map3);

			return orderLast_num;
		}
	}
	
	@GetMapping("/itempay.do") //결제 페이지
	public String itempayapi(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		if (member_idx == null) {
			return "home"; //로그인 필요

		} else {
			String orderLast_num = request.getParameter("idx");
			
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("member_idx", member_idx);
			map1.put("orderLast_num", orderLast_num);
			map1.put("order_state1", "A");
			
			List<OrderVo> orderVo = itemService.getOrderList(map1);
			model.addAttribute("orderVo", orderVo);
			
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("member_idx", member_idx);
			map2.put("orderLast_num", orderLast_num);
			map2.put("orderLast_state1", "A");
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map2);
			model.addAttribute("orderLastVo", orderLastVo);
			
			return "item/itempay";
		}
	}
	
	@PostMapping("/itempayapi.do") //결제 api 호출
	public String itempay(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		if (member_idx == null) {
			return "home"; //로그인 필요

		} else {
			String orderLast_num = request.getParameter("orderLast_num");
			
			MemberVo memberVo = itemService.getMemberDetail2(member_idx);
			model.addAttribute("memberVo", memberVo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("orderLast_num", orderLast_num);
			map.put("orderLast_state1", "A");
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map);
			model.addAttribute("orderLastVo", orderLastVo);

			return "item/itempayapi";
		}
	}
	
	@GetMapping("/itemgettoken.do") //토큰받기 테스트
	public String itemgettoken(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		map.put("orderLast_num", "2022072629764612");
		map.put("orderLast_state1", "A");
		
		int stateResult1 = itemService.updateOrderList(map);
		int stateResult2 = itemService.updateOrderLast(map);
		System.out.println("stateResult1 출력: "+ stateResult1);
		System.out.println("stateResult2 출력: "+ stateResult2);
		
		
		return "item/itemgettoken";
	}
	
	@PostMapping("/itempaycheck.do") //결제 api 검증
	@ResponseBody
	public String itempaycheck(HttpServletRequest request, HttpServletResponse response, @RequestParam("imp_uid") String imp_uid, @RequestParam("merchant_uid") String merchant_uid) throws Exception {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		String result = "N";
		
		if (member_idx == null) {
			return "home"; //로그인 필요
	
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("orderLast_num", merchant_uid);
			map.put("orderLast_state1", "A");
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map);
			int amountDb = orderLastVo.getOrderLast_totalPrice();			
			System.out.println("amountDb 출력: "+ amountDb);
			
			String imp_key = "";
			String imp_secret = "";
			JSONObject json1 = new JSONObject();
			json1.put("imp_key", imp_key);
			json1.put("imp_secret", imp_secret);
		
			String requestURL = "https://api.iamport.kr/users/getToken";
			String Authorization = itemService.getToken(request, response, json1, requestURL);
			
			JSONObject json2 = new JSONObject();
			json2.put("Authorization", Authorization);
			
			String requestURL2 = "https://api.iamport.kr/payments/"+imp_uid;
			
			int amount = itemService.getAmount(request, response, json2, requestURL2, Authorization);
			System.out.println("Amount 출력: "+ amount);
			if (amountDb == amount) {
				int stateResult1 = itemService.updateOrderList(map);
				int stateResult2 = itemService.updateOrderLast(map);
				System.out.println("stateResult1 출력: "+ stateResult1);
				System.out.println("stateResult2 출력: "+ stateResult2);
				result = "Y";
			} else {
				result = "N";
			}

			System.out.println("result 출력: "+ result);
			return result;
		}
	}
	
	
}