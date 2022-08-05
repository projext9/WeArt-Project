package we.are.travelers.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import we.are.travelers.vo.BoardLikeVo;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.SearchCriteria;

@Repository
public class BoardDao {
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "we.are.travelers.board";
	
	@Autowired
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 글 작성
	public int insert_board(BoardVo boardVo) {
		return sqlSession.insert(MAPPER+".insert_board", boardVo);
	}

	// 게시판 리스트
	public List<BoardVo> board_list(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".board_list", scri);
	}
	
	// 게시글 수
	public int board_total(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".board_total", scri);
	}
	
	// 문의 리스트
	public List<BoardVo> inquiry_list(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".inquiry_list", scri);
	}
	
	// 문의 수
	public int inquiry_total(SearchCriteria scri) {
		return sqlSession.selectOne(MAPPER+".inquiry_total", scri);
	}

	// 조회수 증가
	public int update_hits(int board_idx) {
		return sqlSession.update(MAPPER+".update_hits", board_idx);
	}
	
	// 게시판 내용
	public BoardVo board_content(int board_idx) {
		return sqlSession.selectOne(MAPPER+".board_content", board_idx);
	}
	
	// 게시글 삭제
	public int delete_board(int board_idx) {
		return sqlSession.update(MAPPER+".delete_board", board_idx);
	}

	// 게시글 수정
	public int modify_board(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".modify_board", boardVo);
	}
	
	// 게시판 댓글
	public List<BoardVo> board_reply(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".board_reply", scri);
	}

	// 댓글 수
	public int board_reply_total(int board_idx) {
		return sqlSession.selectOne(MAPPER+".board_reply_total", board_idx);
	}

	// 댓글 작성
	public int insert_reply(BoardVo boardVo) {
		return sqlSession.insert(MAPPER+".insert_reply", boardVo);
	}
	
	// 댓글 삭제
	public int delete_reply(int board_idx) {
		return sqlSession.update(MAPPER+".delete_reply", board_idx);
	}
	
	// 댓글 수정
	public int modify_reply(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".modify_reply", boardVo);
	}
	
	// 게시글의 댓글 수 업데이트
	public int update_reply(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".update_reply", boardVo);
	}

	// 추천 수 업데이트
	public int update_like(BoardVo boardVo) {
		return sqlSession.update(MAPPER+".update_like", boardVo);
	}
	
	// 추천 테이블 생성
	public int insert_board_like(BoardLikeVo boardLikeVo) {
		return sqlSession.insert(MAPPER+".insert_board_like", boardLikeVo);
	}
	
	// 추천 테이블 삭제
	public int delete_board_like(BoardLikeVo boardLikeVo) {
		return sqlSession.delete(MAPPER+".delete_board_like", boardLikeVo);
	}

	// 추천 수 조회
	public int like_count(int board_idx) {
		return sqlSession.selectOne(MAPPER+".like_count", board_idx);
	}

	// 사용자의 추천 테이블 조회
	public int select_like_count(BoardLikeVo boardLikeVo) {
		return sqlSession.selectOne(MAPPER+".select_like_count", boardLikeVo);
	}
	
	// 내 글 보기
	public List<BoardVo> my_board(SearchCriteria scri) {
		return sqlSession.selectList(MAPPER+".my_board", scri);
	}

}