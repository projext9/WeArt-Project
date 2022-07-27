package we.are.travelers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;
import we.are.travelers.dao.AdminDao;
import we.are.travelers.vo.MemberVo;

@Service
public class AdminService {
	
	private AdminDao adminDao;
	
	@Autowired
	public AdminService(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	//회원관리 - 회원리스트
	public List<MemberVo> getMemberList(SearchCriteria scri) { //AdminController에서 getMemberList 실행시
		return adminDao.getMemberList(scri); //adminDao의 getMemberList 메소드 실행
	}
	public int member_total(SearchCriteria scri){
		return adminDao.getMemberTotal(scri);
	}
	public List<MemberVo> getMemberContent(String member_idx) {
		return adminDao.getMemberContent(member_idx);
	}
	
	//1:1문의(일반)
	public List<BoardVo> getNoticeMember(SearchCriteria scri) {
		return adminDao.getNoticeMember(scri);
	}
	public int noticeMemberTotal(SearchCriteria scri) {
		return adminDao.getNoticeMemberTotal(scri);
	}
	//구매내역
	public List<OrderVo> getOrderList() {
		return adminDao.getOrderList();
	}
	
	//게시글관리
	public List<BoardVo> getBoardList(SearchCriteria scri) {
		return adminDao.getBoardList(scri);
	}
	public List<BoardVo> getBoardContent(String board_idx) {
		return adminDao.getBoardContent(board_idx);
	}
	public int board_total(SearchCriteria scri) {
		return adminDao.getBoardTotal(scri);
	}
	
	//댓글관리
	public List<BoardVo> getReplyList(SearchCriteria scri) {
		return adminDao.getReplyList(scri);
	}
	public int reply_total(SearchCriteria scri) {
		return adminDao.getReplyTotal(scri);
	}
	
	//판매자관리 - 회원리스트
	public List<MemberVo> getSellorList(SearchCriteria scri) {
		return adminDao.getSellorList(scri);
	}
	public int sellorTotal(SearchCriteria scri) {
		return adminDao.getSellorTotal(scri);
	}
	//1:1문의(판매자)
	public List<BoardVo> getNoticeSellor() {
		return adminDao.getNoticeSellor();
	}
	//승인대기
	public List<MemberVo> getOutstanding() {
		return adminDao.getOutstanding();
	}
	
}
