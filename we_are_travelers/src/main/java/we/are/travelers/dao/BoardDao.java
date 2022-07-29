package we.are.travelers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.SearchCriteria;

@Repository
public class BoardDao {

	//MyBatis를 이용해서 DB작업: SqlSession 객체 필요
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.board";
	
	@Autowired
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert_board(BoardVo boardVo) {
		return sqlSession.insert(MAPPER+".insert_board", boardVo);
	}

	public List<BoardVo> board_list(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".board_list", scri);
	}
	
	public int board_total(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".board_total", scri);
	}

	public int update_hits(int board_idx) {
		return sqlSession.update(MAPPER+".update_hits", board_idx);
	}
	
	public BoardVo board_content(int board_idx) {
		return sqlSession.selectOne(MAPPER+".board_content", board_idx);
	}
	
	public int delete_board(int board_idx) {
		return sqlSession.update(MAPPER+".delete_board", board_idx);
	}

	public int modify_board(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".modify_board", boardVo);
	}

	public BoardVo board_modify_content(int board_idx) {
		return sqlSession.selectOne(MAPPER+".board_modify_content", board_idx);
	}
	
	public List<BoardVo> board_reply(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".board_reply", scri);
	}

	public int board_reply_total(int board_idx) {
		return sqlSession.selectOne(MAPPER+".board_reply_total", board_idx);
	}

	public int insert_reply(BoardVo boardVo) {
		return sqlSession.insert(MAPPER+".insert_reply", boardVo);
	}
	
	public int update_reply(int board_idx) {
		return sqlSession.update(MAPPER+".update_reply", board_idx);
	}

	public int update_like(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".update_like", boardVo);
	}

	public int like_count(int board_idx) {
		return sqlSession.selectOne(MAPPER+".like_count", board_idx);
	}

	public List<BoardVo> my_board(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".my_board", scri);
	}

}