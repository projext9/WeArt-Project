package we.are.travelers.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.SearchCriteria;

@Repository
public class AdminDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.admin";
	
	@Autowired
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<MemberVo> getMemberList(SearchCriteria scri) { //AdminService에서 ADminDao의 getMemberList 실행시
		return sqlSession.selectList(MAPPER+".getMemberList",scri); //namespace가 "ezen.dev.spring.admin" 인 mapper 실행
	} //해당 mapper의 getMemberList 메소드 실행 후 값 반환 -> sqlSession에 값 저장

	public List<CompanyVo> getSellorList(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getSellorList", scri);
	}

	public List<BoardVo> getBoardList(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getBoardList", scri);
	}

	public List<BoardVo> getReplyList(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getReplyList", scri);
	}

	public List<OrderVo> getOrderList(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getOrderList", scri);
	}
	
	public List<BoardVo> getNoticeMember(SearchCriteria scri){
		return sqlSession.selectList(MAPPER+".getNoticeMember", scri);
	}

	public List<BoardVo> getNoticeSellor(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getNoticeSellor");
	}

	public List<CompanyVo> getOutstanding(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".getOutstanding", scri);
	}

	public List<MemberVo> getMemberContent(String member_idx) {
		return sqlSession.selectList(MAPPER+".getMemberContent", member_idx);
	}

	public int getMemberTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getMemberTotal", scri);
	}

	public List<BoardVo> getBoardContent(String board_idx) {
		return sqlSession.selectList(MAPPER+".getBoardContent", board_idx);
	}

	public int getNoticeMemberTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getNoticeMemberTotal", scri);
	}

	public int getBoardTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getBoardTotal", scri);
	}

	public int getSellorTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getSellorTotal", scri);
	}

	public int getReplyTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getReplyTotal", scri);
	}

	public int getOutstandingTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getOutstandingTotal", scri);
	}

	public int getOrderTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getOrderTotal", scri);
	}

	public int getNoticeSellorTotal(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".getNoticeSellorTotal", scri);
	}

	public int updateMemberGrade(HashMap<String, Integer> map) {
		return sqlSession.update(MAPPER+".updateMemberGrade", map);
	}

	public int deleteMemberInfo(List<Integer> member_idx_list) {
		return sqlSession.delete(MAPPER+".deleteMemberInfo", member_idx_list);
	}

	public List<CompanyVo> getSellorContent(String company_idx) {
		return sqlSession.selectList(MAPPER+".getSellorContent", company_idx);
	}
	
	/*public int updateMemberDelyn(MemberVo memberVo) {
		return sqlSession.update(MAPPER+".updateMemberDelyn", memberVo);
	}*/

	/*
	public List<ItemtVo> getItemList() {
		return sqlSession.selectList(MAPPER+".getItemList");
	}
	*/


}
