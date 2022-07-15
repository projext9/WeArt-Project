package we.are.travelers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.ItemDao;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.OptionVo;

@Service
public class ItemService {
	
	private ItemDao itemDao;
	
	@Autowired
	public ItemService(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	
	public int addItem(ItemVo itemVo) {
		return itemDao.addItem(itemVo);
	}

	public List<ItemVo> getItemList() { //상품 리스트 호출
		return itemDao.getItemList();
	}

	public ItemVo getItemDetail(int item_idx) { //상품 상세 호출
		return itemDao.getItemDetail(item_idx);
	}
	
	public List<OptionVo> getItemOption(int item_idx) { //상품 상세 호출(옵션)
		return itemDao.getItemOption(item_idx);
	}
	
	public int addItemCart(HashMap<String, Object> map) { //장바구니 담기
		int result = 0;
		result = itemDao.addItemCart(map);
		System.out.println(result);
		return result;
	}
	
	public List<Map<String, Object>> getCartList(String member_idx) { //장바구니 호출
		return itemDao.getCartList(member_idx);
	}
}
