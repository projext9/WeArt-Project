package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.dao.MyDao;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;

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

	public List<OrderLastVo> getPayment(String member_idx) {
		return myDao.getPayment(member_idx);
	}

	public List<BoardVo> getMyNotice(String member_idx) {
		return myDao.getMyNotice(member_idx);
	}

	public List<OrderVo> getPaymentContent(String orderLast_num) {
		return myDao.getPaymentContent(orderLast_num);
	}

	public List<BoardVo> getMyNoticeContent(String board_subject) {
		return myDao.getMyNoticeContent(board_subject);
	}

	public int modify_info(MemberVo memberVo) {
		return myDao.modify_info(memberVo);
	}

	public int info_checkPwd(MemberVo mv) {
		return myDao.info_checkPwd(mv);
	}

}