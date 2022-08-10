package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.MyDao;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.SearchCriteria;

@Service
public class MyService {

	private MyDao myDao;
	
	@Autowired
	public MyService(MyDao myDao) {
		this.myDao = myDao;
	}

	public List<MemberVo> getInfo(String member_idx) {
		return myDao.getInfo(member_idx);
	}

	public List<OrderLastVo> getPayment(SearchCriteria scri) {
		return myDao.getPayment(scri);
	}

	public List<OrderLastVo> getPaymentContent(String orderLast_num) {
		return myDao.getPaymentContent(orderLast_num);
	}

	public int modify_info(MemberVo memberVo) {
		return myDao.modify_info(memberVo);
	}

	public int info_checkPwd(MemberVo mv) {
		return myDao.info_checkPwd(mv);
	}

	public int payment_total(SearchCriteria scri) {
		return myDao.payment_total(scri);
	}

}
