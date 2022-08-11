package we.are.travelers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.FileUtils;
import we.are.travelers.dao.BoardDao;
import we.are.travelers.vo.BoardLikeVo;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.SearchCriteria;

@Service
public class BoardService {

	private BoardDao boardDao;
	
	@Autowired
	public BoardService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	
	// ckeditor 이미지 업로드
	// write 내부 이미지 업로드 기능
	public static Map<String, Object> uploadImg(MultipartFile img, HttpSession session, HttpServletRequest request) {
		
		System.out.println("img : " + img.getOriginalFilename());
		String folder = "/resources/upload";	// 이미지를 저장할 폴더 경로 (경로 뒤에 /는 빼야 됨)
		String ctntImg = null;
		
		// 첨부파일 업로드
		try {
			ctntImg = FileUtils.transferTo(img, true, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(ctntImg == null) {
			return null;
		}
		
		// /u : 유니코드 이스케이프 시퀀스, /n : 개행문자 || 이 두 문자는 주석 안에 있는 경우 오류가 발생하므로 \대신 /으로 대체하였음
		// 톰캣 서버에 저장된 이미지 경로 = D:\WeArt\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\travelers\resources/upload
		// Servers의 server.xml 파일에 <Context docBase="이미지 실제 경로" path="호출할 때 쓸 경로" reloadable="true"/> 추가
		// ex) <Context docBase="D:\WeArt\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\travelers\resources/upload" path="/resources/upload" reloadable="true"/>
		// 위아트용 업로드 경로 <Context docBase="D:\OpenApi(B)\WeArt\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\we_are_travelers\resources/upload" path="/resources/upload" reloadable="true"/>
		
		Map<String, Object> json = new HashMap<String, Object> ();
		json.put("uploaded", 1);
		json.put("fileName", ctntImg);
		json.put("url", "/resources/upload/" + ctntImg);	// 이미지가 저장되는 경로 (server.xml에 Context를 추가한 경우 path값 뒤에 /만 붙여주면 됨)

		return json;
	}

	// 게시판 글 작성
	public int insert_board(BoardVo boardVo) {
		int result=0;
		result = boardDao.insert_board(boardVo);
		return result;
	}

	// 게시판 리스트
	public List<BoardVo> board_list(SearchCriteria scri) {
		return boardDao.board_list(scri);
	}
	
	// 게시글 수
	public int board_total(SearchCriteria scri) {
		return boardDao.board_total(scri);
	}
	
	// 문의 리스트
	public List<BoardVo> inquiry_list(SearchCriteria scri) {
		return boardDao.inquiry_list(scri);
	}
	
	// 문의 수
	public int inquiry_total(SearchCriteria scri) {
		return boardDao.inquiry_total(scri);
	}
	
	// 조회수 증가
	public int update_hits(int board_idx) {
		return boardDao.update_hits(board_idx);
	}
	
	// 게시판 내용
	public BoardVo board_content(int board_idx) {
		return boardDao.board_content(board_idx);
	}
	
	// 게시글 삭제
	public int delete_board(int board_idx) {
		return boardDao.delete_board(board_idx);
	}

	// 게시글 수정
	public int modify_board(BoardVo boardVo) {
		return boardDao.modify_board(boardVo);
	}

	// 게시판 댓글
	public List<BoardVo> board_reply(SearchCriteria scri) {
		return boardDao.board_reply(scri);
	}

	// 댓글 수
	public int board_reply_total(int board_idx) {
		return boardDao.board_reply_total(board_idx);
	}

	// 댓글 작성
	public int insert_reply(BoardVo boardVo) {
		int result=0;
		result = boardDao.insert_reply(boardVo);
		return result;
	}
	
	// 댓글 삭제
	public int delete_reply(int board_idx) {
		return boardDao.delete_reply(board_idx);
	}
	
	// 댓글 수정
	public int modify_reply(BoardVo boardVo) {
		return boardDao.modify_reply(boardVo);
	}

	// 게시글의 댓글 수 업데이트
	public int update_reply(BoardVo boardVo) {
		return boardDao.update_reply(boardVo);
	}

	// 추천 수 업데이트
	public int update_like(BoardVo boardVo) {
		return boardDao.update_like(boardVo);
	}
	
	// 추천 테이블 생성
	public int insert_board_like(BoardLikeVo boardLikeVo) {
		return boardDao.insert_board_like(boardLikeVo);
	}
	
	// 추천 테이블 삭제
	public int delete_board_like(BoardLikeVo boardLikeVo) {
		return boardDao.delete_board_like(boardLikeVo);
	}

	// 추천 수 조회
	public int like_count(int board_idx) {
		return boardDao.like_count(board_idx);
	}

	// 사용자의 추천 테이블 조회
	public int select_like_count(BoardLikeVo boardLikeVo) {
		return boardDao.select_like_count(boardLikeVo);
	}
	
	// 내 글 보기
	public List<BoardVo> my_board(SearchCriteria scri) {
		return boardDao.my_board(scri);
	}

	public int modify_delyn(BoardVo boardVo) {
		return boardDao.modify_delyn(boardVo);
	}
	// 게시판 내용
	public BoardVo admin_board_content(int board_idx) {
		return boardDao.admin_board_content(board_idx);
	}

}