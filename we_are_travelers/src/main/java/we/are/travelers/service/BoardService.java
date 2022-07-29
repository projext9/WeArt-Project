package we.are.travelers.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.FileUtils;
import we.are.travelers.dao.BoardDao;
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
	public static Map<String, Object> uploadImg(MultipartFile img, HttpSession session) {
		
		System.out.println("img : " + img.getOriginalFilename());
		String folder = "/resources/upload";
		String ctntImg = null;
		
		// 첨부파일 업로드
		try {
			ctntImg = FileUtils.transferTo(img, true, folder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(ctntImg == null) {
			return null;
		}
		
		// 톰캣 서버에 저장된 이미지 경로 = D:\WeArt\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\work\Catalina\localhost\travelers\resources/upload
		// Servers의 server.xml 파일에 <Context docBase="이미지 실제 경로" path="호출할 때 쓸 경로" reloadable="true"/> 추가
		Map<String, Object> json = new HashMap<String, Object> ();
		json.put("uploaded", 1);
		json.put("fileName", ctntImg);
		json.put("url", "/upload/img/" + ctntImg);

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

	// 게시글 수정
	public BoardVo board_modify_content(int board_idx) {
		return boardDao.board_modify_content(board_idx);
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

	// 게시글의 reply 업데이트
	public int update_reply(int board_idx) {
		return boardDao.update_reply(board_idx);
	}

	public int update_like(BoardVo boardVo) {
		return boardDao.update_like(boardVo);
	}

	public int like_count(int board_idx) {
		return boardDao.like_count(board_idx);
	}

	public List<BoardVo> my_board(SearchCriteria scri) {
		return boardDao.my_board(scri);
	}

}