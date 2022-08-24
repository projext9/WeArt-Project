package we.are.travelers.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.MyDao;
import we.are.travelers.dao.SellerDao;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.ItemVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;

@Service
public class SellerService {

	private SellerDao sellerDao;
	
	@Autowired
	public SellerService(SellerDao sellerDao) {
		this.sellerDao = sellerDao;
	}

	public CompanyVo getInfo(String company_idx) {
		return sellerDao.getInfo(company_idx);
	}

	public List<ItemVo> getItemlist(String company_idx) {
		return sellerDao.getItemlist(company_idx);
	}
	
	public List<Map<String, Object>> getItemOrder(String company_idx) {
		return sellerDao.getItemOrder(company_idx);
	}

}
