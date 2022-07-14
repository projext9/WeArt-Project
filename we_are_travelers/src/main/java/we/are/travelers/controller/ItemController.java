package we.are.travelers.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@GetMapping("/itemcart.do")
	public String itemcart() {
		return "item/itemcart";
	}
	
	@GetMapping("/itemorder.do")
	public String itemorder() {
		return "item/itemorder";
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
	public String itemcartadd(HttpServletRequest request, @RequestParam("optionValue") int option_idx, @RequestParam("pieceValue") int cart_count) {
		HttpSession session = request.getSession();
		String member_idx = (String)session.getAttribute("member_idx");

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_idx", member_idx);
		map.put("option_idx", option_idx);
		map.put("cart_count", cart_count);

		String result="N"; //정보수정 실패
		
		int flag = itemService.addItemCart(map);
		
		if(flag == 1) result = "Y"; //정보수정 성공
		System.out.println("플레그" + flag);
		return result;
	}
	
	
}

