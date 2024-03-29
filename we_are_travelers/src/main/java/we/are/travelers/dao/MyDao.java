package we.are.travelers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;

@Repository
public class MyDao {

	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.myPage";
	
	@Autowired
	public MyDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<MemberVo> getInfo(String member_idx) {
		return sqlSession.selectList(MAPPER+".getInfo", member_idx);
	}

	public List<OrderLastVo> getPayment(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getPayment", scri);
	}

	public List<OrderVo> getPaymentContent(OrderVo orderVo) {
		return sqlSession.selectList(MAPPER+".getPaymentContent", orderVo);
	}
	
	public int modify_info(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".modify_info", memberVo);
	}

	public int info_checkPwd(MemberVo mv) {
		return sqlSession.selectOne(MAPPER+".info_checkPwd", mv);
	}

	public int payment_total(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".payment_total", scri);
	}

	public List<BoardVo> getMyNotice(String member_idx) {
		return sqlSession.selectList(MAPPER+".getMyNotice", member_idx);
	}
	
	/*
	 * public List<BoardVo> inquiry_list(String member_idx) { return
	 * sqlSession.selectList(MAPPER+".inquiry_list", member_idx); }
	 */

	public List<BoardVo> getMyNoticeContent(String board_subject) {
		return sqlSession.selectList(MAPPER+".getMyNoticeContent", board_subject);
	}

}
