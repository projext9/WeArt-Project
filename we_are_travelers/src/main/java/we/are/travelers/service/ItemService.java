package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.ItemDao;
import we.are.travelers.vo.ItemVo;

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


	public List<ItemVo> getItemList() {
		return itemDao.getItemList();
	}

}
