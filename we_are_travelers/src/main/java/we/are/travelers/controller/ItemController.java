package we.are.travelers.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import we.are.travelers.service.ItemService;
import we.are.travelers.vo.CompanyVo;
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
	
	@GetMapping("/shopculture.do") //문화 상품페이지 호출
	public String cultureshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="1") String itemCode, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURL().toString(); //현재 페이지 세션 저장
		session.setAttribute("historyBack1", uri);
		
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
		return "item/shopculture";
	}
	
	@GetMapping("/shopactivity.do") //액티비티 상품페이지 호출
	public String activityshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="2") String itemCode, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURL().toString(); //현재 페이지 세션 저장
		session.setAttribute("historyBack1", uri);
		
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
		return "item/shopactivity";
	}
	
	@GetMapping("/shopfishing.do") //낚시 상품페이지 호출
	public String fishingshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="3") String itemCode, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURL().toString(); //현재 페이지 세션 저장
		session.setAttribute("historyBack1", uri);
		
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
		return "item/shopfishing";
	}
	
	@GetMapping("/shopcamping.do") //캠핑 상품페이지 호출
	public String campingshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="4") String itemCode, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURL().toString(); //현재 페이지 세션 저장
		session.setAttribute("historyBack1", uri);
		
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
		return "item/shopcamping";
	}
	@GetMapping("/shopstay.do") //숙박 상품페이지 호출
	public String stayshop(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="itemCode", defaultValue="5") String itemCode, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String uri = request.getRequestURL().toString(); //현재 페이지 세션 저장
		session.setAttribute("historyBack1", uri);
		
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
		return "item/shopstay";
	}
	
	@GetMapping("/itemdetail.do") //상품 상세페이지 호출
	public String itemdetail(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String item_idx = request.getParameter("iidx");
		int item_idx_ = Integer.parseInt(item_idx);
		
		String itemCode = request.getParameter("itemCode");
		int itemCode_ = Integer.parseInt(itemCode);
		
		String uri = request.getRequestURL().toString(); //현재 페이지 세션 저장
		String uri2 = uri+"?iidx="+item_idx+"&itemCode="+itemCode;
		session.setAttribute("historyBack2", uri2);
		
		ItemVo itemVo = itemService.getItemDetail(item_idx_); //상품 상세 호출
		model.addAttribute("itemVo", itemVo);
		
		List<OptionVo> optionList = itemService.getItemOption(item_idx_); //상품 상세 호출(옵션)
		model.addAttribute("optionList", optionList);
		
		String company_idx = itemVo.getCompany_idx();
		CompanyVo companyVo = itemService.getItemCompany(company_idx); //상품 상세 호출(판매자명)
		model.addAttribute("companyVo", companyVo);
		
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
		
		String uri = request.getHeader("Referer"); //이전 페이지 세션 저장
		session.setAttribute("historyBack", uri);

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
			String orderLast_cashReceipt = request.getParameter("orderLast_cashReceipt");
			
			MemberVo memberVo = itemService.getMemberDetail2(member_idx); //회원정보 호출
			model.addAttribute("memberVo", memberVo);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("member_idx", member_idx);
			map.put("orderLast_num", orderLast_num);
			map.put("orderLast_cashReceipt", orderLast_cashReceipt);
			map.put("orderLast_state1", "A");
			
			int result = itemService.updateCashReceipt(map); //주문서 업데이트(현금영수증)
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map); //주문서 호출
			model.addAttribute("orderLastVo", orderLastVo);

			return "item/itempayapi";
		}
	}
	
	@SuppressWarnings("unchecked")
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
			
			itemService.updateOrderState1B(map); //주문서(개별상품) 상태변경(결제완료)
			itemService.updateOrderLastState1B(map); //주문서 상태변경(결제완료)
			itemService.updateItemCartY(member_idx); //카트 상태 변경 "S" to "Y"
			
			OrderLastVo orderLastVo = itemService.getOrderLast(map); //주문서 호출
			int amountDb = orderLastVo.getOrderLast_totalPrice();			
			
			String imp_key = "6865143342864354";
			String imp_secret = "7zYXIg2Zf0pQKk3jAKPBIRakr3gFXNDIcQ23qrUX2G3ZykeAy4tP3JfU8QPeHbOjRcY57aFGRhM1LaxL";
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
				itemService.updateOrderState1C(map); //주문서(개별상품) 상태변경(검증완료)
				itemService.updateOrderLastState1C(map); //주문서 상태변경(검증완료)
				
				result = "Y";
			} else {
				result = "N";
			}
			return result;
		}
	}
	
	@GetMapping("/itemwrite.do") //판매상품 입력(상품작성)
	public String itemwrite(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			itemService.deleteAllItem(company_idx); //찌꺼기 제거
			return "item/itemwrite";
		}
	}

	@PostMapping("/itemwriteaction.do") //판매상품 입력 실행(상품작성)
	@ResponseBody
	public String itemwriteaction(ItemVo itemVo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			itemService.deleteAllItem(company_idx); //찌꺼기 제거

			itemVo.setCompany_idx(company_idx); //기업번호 입력
			itemVo.setItem_content("TEMP"); //임시
			int result = itemService.addItem(itemVo); //판매상품 입력 실행(상품작성)

			String result_ = String.valueOf(result);
			return result_;
		}
	}

	@GetMapping("/itemwrite2.do") //판매상품 입력(상세정보 등록)
	public String itemwrite2(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			ItemVo itemVo = itemService.getAddedItem(company_idx); //최근 작성 게시글 호출
			model.addAttribute("itemVo", itemVo);
			
			CompanyVo companyVo = itemService.getItemCompany(company_idx); //상품 상세 호출(판매자명)
			model.addAttribute("companyVo", companyVo);
			
			return "item/itemwrite2";
		}
	}

	@PostMapping("/itemwrite2action.do") //판매상품 입력 실행(상세정보 등록)
	public String itemwrite2action(ItemVo itemVo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			itemVo.setCompany_idx(company_idx); //기업번호 입력
			
			int result = itemService.addItemContent(itemVo); //판매상품 입력 실행(상세정보 등록)
			
			itemVo = itemService.getAddedItem(company_idx); //최근 작성 게시글 호출
			model.addAttribute("itemVo", itemVo);
			
			CompanyVo companyVo = itemService.getItemCompany(company_idx); //상품 상세 호출(판매자명)
			model.addAttribute("companyVo", companyVo);

			return "item/itemwrite3";
		}
	}

	@PostMapping("/itemimgupload.do") //상품 이미지 업로드
	@ResponseBody
	public String itemimgupload(@RequestParam("item_originImg") MultipartFile item_originImg, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			//<input type ="file" name="uploadFile" />에서 업로드된 파일객체를 MultipartFile uploadFile에 저장
			
			//업로드된 파일을 프로젝트 내의 upload 폴더에 저장하기 전에 DB의 upload_file 테이블에 저장할 
			//origin_filename과 system_filename 값을 세팅함
			
			String origin_fileName = item_originImg.getOriginalFilename();
			
			//시스템 파일명은 원본 파일명에서 파일명과 확장자를 분리한 다음 파일명에 시스템시간을 추가한 후 다시 확장자를 붙이는 식으로 생성
			int dot_idx = origin_fileName.lastIndexOf(".");
			String fileName1 = origin_fileName.substring(0, dot_idx);
			String extension = origin_fileName.substring(dot_idx+1);
			String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
			String system_fileName = fileName2+"."+extension;
			
			//upload 디렉토리에 대한 실제 경로 확인을 위해 ServletContext객체를 이용
			String upload_dir = "resources/itemimg/";

			String realPath = request.getServletContext().getRealPath(upload_dir);
			System.out.println("이클립스로 저장된 파일의 실제 경로: " + realPath);
			
			//지정된 경로에 파일 저장
			//realPath와 system_fileName을 합쳐서 전체경로를 얻어야 함
			String fullPath = realPath+system_fileName;
			item_originImg.transferTo(new File(fullPath));
			
			int result=0; //0:입력 실패
			
			ItemVo itemVo = new ItemVo();
			itemVo.setCompany_idx(company_idx);
			itemVo.setItem_originImg(origin_fileName);
			itemVo.setItem_img(system_fileName);
			
			result = itemService.addItemImg(itemVo);
			
			String result_ = String.valueOf(result);
			
			return result_;
		}
	}
	
	@PostMapping("/itemwrite3.do") //판매상품 입력(옵션 등록)
	public String itemwrite3(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");

		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			ItemVo itemVo = itemService.getAddedItem(company_idx); //최근 작성 게시글 호출
			model.addAttribute("itemVo", itemVo);
			
			CompanyVo companyVo = itemService.getItemCompany(company_idx); //상품 상세 호출(판매자명)
			model.addAttribute("companyVo", companyVo);
			
			return "item/itemwrite3";
		}
	}

	@PostMapping("/itemwrite3action.do") //판매상품 입력 실행(옵션 등록)
	public String itemwrite3action(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String company_idx = (String)session.getAttribute("company_idx");
	    	
		if (company_idx == null) {
			return "login"; //로그인 필요

		} else {
			ItemVo itemVo = itemService.getAddedItem(company_idx); //최근 작성 게시글 호출
			model.addAttribute("itemVo", itemVo);
			int item_idx = itemVo.getItem_idx();
			String item_idx_ = String.valueOf(item_idx);
			

			String[] option_number_list = request.getParameterValues("option_number");
			String[] option_name_list = request.getParameterValues("option_name");
			String[] option_price_list = request.getParameterValues("option_price");
			String[] option_postPrice_list = request.getParameterValues("option_postPrice");
			String[] option_stock_list = request.getParameterValues("option_stock");
			
			int length = option_number_list.length;
			
			for(int i = 0; i < length; i++) {
				String option_number = option_number_list[i];
				String option_name = option_name_list[i];
				String option_price = option_price_list[i];
				String option_postPrice = option_postPrice_list[i];
				String option_stock = option_stock_list[i];
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("company_idx", company_idx);
				map.put("item_idx", item_idx_);
				map.put("option_number", option_number);
				map.put("option_name", option_name);
				map.put("option_price", option_price);
				map.put("option_postPrice", option_postPrice);
				map.put("option_stock", option_stock);
				
				itemService.addItemOption(map); //판매상품 입력 실행(옵션 등록)
			}

			itemService.updateItemOption(item_idx_); //아이템 상태 변경 "T" to "N"
			
			return "item/itemwrite4";
		}
	}
	
}