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

@Controller
public class ItemController {
	
	private ItemService itemService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}
	
	@GetMapping("/itemlist.do")
	public String itemlist() {
		return "item/itemlist";
	}
	
	@GetMapping("/itemdetail.do")
	public String itemdetail() {
		return "item/itemdetail";
	}
	
	@GetMapping("/itemcart.do")
	public String itemcart() {
		return "item/itemcart";
	}
	
	@GetMapping("/itemlist2.do")//get방식 요청 처리
	public String item_list(Model model) {
		
		List<ItemVo> itemList = itemService.getItemList();
		model.addAttribute("itemList", itemList);
		
		return "item/list2";
	}
	
	
}

