package we.are.travelers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderLastVo;
import we.are.travelers.vo.OrderVo;

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

	public List<OrderLastVo> getPayment(String member_idx) {
		return sqlSession.selectList(MAPPER+".getPayment", member_idx);
	}

	public List<BoardVo> getMyNotice(String member_idx) {
		return sqlSession.selectList(MAPPER+".getMyNotice", member_idx);
	}

	public List<OrderVo> getPaymentContent(String orderLast_num) {
		return sqlSession.selectList(MAPPER+".getPaymentContent", orderLast_num);
	}

	public List<BoardVo> getMyNoticeContent(String board_subject) {
		return sqlSession.selectList(MAPPER+".getMyNoticeContent", board_subject);
	}

	public int modify_info(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".modify_info", memberVo);
	}

	public int info_checkPwd(MemberVo mv) {
		return sqlSession.selectOne(MAPPER+".info_checkPwd", mv);
	}

}
