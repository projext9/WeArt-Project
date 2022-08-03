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
import we.are.travelers.vo.PageMaker;
import we.are.travelers.vo.SearchCriteria;

@Controller
public class ItemController {
	
	private ItemService itemService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}
	
	@GetMapping("/cultureshop.do") //문화 상품페이지 호출
	public String cultureshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="1") String itemCode, HttpServletRequest request) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = itemService.item_total_culture(scri); //상품 리스트 갯수(문화)
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<ItemVo> ItemVoList = itemService.getList_culture(scri); //상품 리스트 호출(문화)
		model.addAttribute("ItemVoList", ItemVoList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		request.setAttribute("itemCode", itemCode);
		return "item/cultureshop";
	}
	
	@GetMapping("/activityshop.do") //액티비티 상품페이지 호출
	public String activityshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="2") String itemCode, HttpServletRequest request) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = itemService.item_total_activity(scri); //상품 리스트 갯수(액티비티)
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<ItemVo> ItemVoList = itemService.getList_activity(scri); //상품 리스트 호출(액티비티)
		model.addAttribute("ItemVoList", ItemVoList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		request.setAttribute("itemCode", itemCode);
		return "item/activityshop";
	}
	
	@GetMapping("/fishingshop.do") //낚시 상품페이지 호출
	public String fishingshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="3") String itemCode, HttpServletRequest request) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = itemService.item_total_fishing(scri); //상품 리스트 갯수(낚시)
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<ItemVo> ItemVoList = itemService.getList_fishing(scri); //상품 리스트 호출(낚시)
		model.addAttribute("ItemVoList", ItemVoList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		request.setAttribute("itemCode", itemCode);
		return "item/fishingshop";
	}
	
	@GetMapping("/campingshop.do") //캠핑 상품페이지 호출
	public String campingshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="4") String itemCode, HttpServletRequest request) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = itemService.item_total_camping(scri); //상품 리스트 갯수(캠핑)
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<ItemVo> ItemVoList = itemService.getList_camping(scri); //상품 리스트 호출(캠핑)
		model.addAttribute("ItemVoList", ItemVoList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		request.setAttribute("itemCode", itemCode);
		return "item/campingshop";
	}
	@GetMapping("/stayshop.do") //숙박 상품페이지 호출
	public String stayshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="5") String itemCode, HttpServletRequest request) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = itemService.item_total_stay(scri); //상품 리스트 갯수(숙박)
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<ItemVo> ItemVoList = itemService.getList_stay(scri); //상품 리스트 호출(숙박)
		model.addAttribute("ItemVoList", ItemVoList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		request.setAttribute("itemCode", itemCode);
		return "item/stayshop";
	}
	
	@GetMapping("/itemdetail.do") //상품 상세페이지 호출
	public String itemdetail(Model model, HttpServletRequest request) {
		String item_idx = request.getParameter("iidx");
		int item_idx_ = Integer.parseInt(item_idx);
		
		String itemCode = request.getParameter("itemCode");
		int itemCode_ = Integer.parseInt(itemCode);
		
		ItemVo itemVo = itemService.getItemDetail(item_idx_); //상품 상세 호출
		model.addAttribute("itemVo", itemVo);
		
		List<OptionVo> optionList = itemService.getItemOption(item_idx_); //상품 상세 호출(옵션)
		model.addAttribute("optionList", optionList);
		
		request.setAttribute("itemCode", itemCode_);

		return "item/itemdetail";
	}

	@PostMapping("/itemcartadd.do") //카트 상품담기
	@ResponseBody
	public String itemcartadd(HttpServletRequest request, @RequestParam("optionValue") int option_idx, @RequestParam("pieceValue") int cart_count) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		String result = "N";

		if (member_idx == null) {
			result = "L"; //로그인 필요
			return result;
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("option_idx", option_idx);
			map.put("cart_count", cart_count);

			int flag = itemService.addItemCart(map); //장바구니 담기
			if(flag == 1) result = "Y";

			return result;
		}
	}

	@GetMapping("/itemcart.do") //카트 페이지
	public String itemcart(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");

		if (member_idx == null) {
			return "login"; //로그인 필요

		} else {
			itemService.updateItemCartN(member_idx); //카트 상태 복구 "S" to "N"
			
			List<Map<String, Object>> map2 = itemService.getCartList(member_idx); //장바구니 호출

			model.addAttribute("CartListMap", map2);

			return "item/itemcart";
		}
	}
	
	@PostMapping("/itemcartdelete.do") //카트 상품삭제
	public String itemcartdelete(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");

		if (member_idx == null) {
			return "login"; //로그인 필요

		} else {
			String[] cart_idx_list = request.getParameterValues("cart_idx");
			if (cart_idx_list != null) {
				List<String> cart_idx_list_ = Arrays.asList(cart_idx_list);
				
				HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("member_idx", member_idx);
				map1.put("cart_idx_list_", cart_idx_list_);
				
				itemService.delItemCart(map1); //장바구니 삭제
			}
			
			List<Map<String, Object>> map2 = itemService.getCartList(member_idx); //장바구니 호출

			model.addAttribute("CartListMap", map2);

			return "item/itemcart";
		}
	}
	
	@PostMapping("/itemorder.do") //배송지 입력 페이지
	public String itemorder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");

		if (member_idx == null) {
			return "login"; //로그인 필요

		} else {
			String total_itemPrice = request.getParameter("hidden_itemPrice");
			String total_postPrice = request.getParameter("hidden_postPrice");
			String total_price = request.getParameter("hidden_price");
			
			String[] cart_idx_list = request.getParameterValues("cart_idx");
			List<String> cart_idx_list_ = Arrays.asList(cart_idx_list);	
			List<Map<String, Object>> map1 = itemService.getItemOrder(cart_idx_list_); //배송지 입력 호출(상품)
			model.addAttribute("ItemOrderMap", map1);
			
			Map<String, Object> map2 = itemService.getMemberDetail(member_idx); //배송지 입력 호출(회원정보)
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
			return "login"; //로그인 필요

		} else {
			itemService.deleteAllOrder(member_idx); //찌꺼기 제거
			itemService.deleteAllOrderLast(member_idx); //찌꺼기 제거
			
			String[] cart_idx_list = request.getParameterValues("cart_idx");
			List<String> cart_idx_list_ = Arrays.asList(cart_idx_list);
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("member_idx", member_idx);
			map1.put("cart_idx_list_", cart_idx_list_);
			
			itemService.updateItemCartS(map1); //카트 상태 변경 "N" to "S"
			
			LocalDate now = LocalDate.now(); //현재 날짜
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd"); //포맷 정의
			String formatedNow = now.format(formatter); //포맷 적용
			
			String num = "";
		    for (int i = 1; i <= 8; i++) {
		        char ch = (char) ((Math.random() * 10) + 48);
		        num = num + String.valueOf(ch);
		    }
			String orderLast_num = formatedNow+num;
			
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
				HashMap<String, Object> map2 = itemService.getItemSelected(cart_idx); //카트 선택 상품
				int option_idx = (int)map2.get("option_idx");
				String company_idx = (String)map2.get("company_idx");
				String order_itemName = (String)map2.get("item_name");
				String order_optionName = (String)map2.get("option_name");
				int order_price = (int)map2.get("option_price");
				int order_count = (int)map2.get("cart_count");
				int order_postPrice = (int)map2.get("option_postPrice");
				int order_totalPrice = order_price*order_count;
				
				HashMap<String, Object> map3 = new HashMap<String, Object>();
				map3.put("member_idx", member_idx);
				map3.put("orderLast_num", orderLast_num);
				map3.put("option_idx", option_idx);
				map3.put("company_idx", company_idx);
				map3.put("order_itemName", order_itemName);
				map3.put("order_optionName", order_optionName);
				map3.put("order_price", order_price);
				map3.put("order_count", order_count);
				map3.put("order_postPrice", order_postPrice);
				map3.put("order_totalPrice", order_totalPrice);
				
				orderLast_itemPrice = orderLast_itemPrice+order_totalPrice;
				orderLast_postPrice = orderLast_postPrice+order_postPrice;
				orderLast_totalPrice = orderLast_totalPrice+order_postPrice+order_totalPrice;

				itemService.addOrderDetail(map3); //주문서 등록(개별상품)
			}
			
			HashMap<String, Object> map4 = new HashMap<String, Object>();
			map4.put("member_idx", member_idx);
			map4.put("orderLast_num", orderLast_num);
			map4.put("orderLast_itemPrice", orderLast_itemPrice);
			map4.put("orderLast_postPrice", orderLast_postPrice);
			map4.put("orderLast_totalPrice", orderLast_totalPrice);
			map4.put("orderLast_name", orderLast_name);
			map4.put("orderLast_phone", orderLast_phone);
			map4.put("orderLast_address", orderLast_address);
			map4.put("orderLast_msg", orderLast_msg);
			map4.put("orderLast_cashReceipt", orderLast_cashReceipt);
			
			itemService.addOrderLast(map4); //주문서 등록

			return orderLast_num;
		}
	}
	
	@GetMapping("/itempay.do") //결제 페이지
	public String itempayapi(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		if (member_idx == null) {
			return "login"; //로그인 필요

		} else {
			String orderLast_num = request.getParameter("idx");
			
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("member_idx", member_idx);
			map1.put("orderLast_num", orderLast_num);
			map1.put("order_state1", "A");
			
			List<OrderVo> orderVo = itemService.getOrderList(map1); //주문예정 상품 호출
			model.addAttribute("orderVo", orderVo);
			
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("member_idx", member_idx);
			map2.put("orderLast_num", orderLast_num);
			map2.put("orderLast_state1", "A");
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map2); //주문서 호출
			model.addAttribute("orderLastVo", orderLastVo);
			
			return "item/itempay";
		}
	}
	
	@PostMapping("/itempayapi.do") //결제 api 호출
	public String itempay(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		
		if (member_idx == null) {
			return "login"; //로그인 필요

		} else {
			String orderLast_num = request.getParameter("orderLast_num");
			
			MemberVo memberVo = itemService.getMemberDetail2(member_idx); //회원정보 호출
			model.addAttribute("memberVo", memberVo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("orderLast_num", orderLast_num);
			map.put("orderLast_state1", "A");
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map); //주문서 호출
			model.addAttribute("orderLastVo", orderLastVo);

			return "item/itempayapi";
		}
	}
	
	@PostMapping("/itempaycheck.do") //결제 api 검증
	@ResponseBody
	public String itempaycheck(HttpServletRequest request, HttpServletResponse response, @RequestParam("imp_uid") String imp_uid, @RequestParam("merchant_uid") String merchant_uid) throws Exception {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");
		String result = "N";
		
		if (member_idx == null) {
			return "login"; //로그인 필요
	
		} else {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("orderLast_num", merchant_uid);
			map.put("orderLast_state1", "B");
			
			int stateResult1 = itemService.updateOrderState1B(map); //주문서(개별상품) 상태변경(결제완료)
			int stateResult2 = itemService.updateOrderLastState1B(map); //주문서 상태변경(결제완료)
			itemService.updateItemCartY(member_idx); //카트 상태 변경 "S" to "Y"
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map); //주문서 호출
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

			if (amountDb == amount) {
				int stateResult3 = itemService.updateOrderState1C(map); //주문서(개별상품) 상태변경(검증완료)
				int stateResult4 = itemService.updateOrderLastState1C(map); //주문서 상태변경(검증완료)
				
				result = "Y";
			} else {
				result = "N";
			}
			return result;
		}
	}
	
	@GetMapping("/itemwrite.do") //판매상품 입력 페이지
	public String itemwrite(HttpServletRequest request, Model model) {
		System.out.println("a");
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			return "item/itemwrite";
		}
	}

	@PostMapping("/itemwriteaction.do") //판매상품 입력 진행
	public String itemwriteaction(HttpServletRequest request, Model model) {
		System.out.println("a2");
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			return "item/itemwrite";
		}
	}
	
	
}