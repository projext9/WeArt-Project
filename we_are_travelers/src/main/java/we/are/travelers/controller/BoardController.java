package we.are.travelers.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import we.are.travelers.service.BoardService;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.PageMaker;
import we.are.travelers.vo.SearchCriteria;

@Controller
public class BoardController {
	
	private BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	// CKEditor 이미지 업로드 부분
	@ResponseBody
	@PostMapping("/imageUploadProcess.do")
	public Map<String, Object> imgUpload(@RequestParam("upload") MultipartFile img, HttpSession session) {
		return BoardService.uploadImg(img, session);
	}
	
	@PostMapping("/insert_board.do")
	public String insert_board(BoardVo boardVo) throws IOException {

		String writer = "writer";
		boardVo.setBoard_writer(writer);
        String ip = InetAddress.getLocalHost().getHostAddress();
        boardVo.setBoard_ip(ip);
        
        // board_content 에서 HTML 태그 제거
        String board_remove_tag = boardVo.getBoard_content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
        boardVo.setBoard_remove_tag(board_remove_tag);
        
		// 이미지 태그를 추출
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = boardVo.getBoard_content();
		Matcher match = pattern.matcher(content);
		String image = null;
		
		if(match.find()) {			// 이미지가 있으면
			image = match.group(0); // 첫번째 이미지 태그 추출
			boardVo.setBoard_image(image);
		}
		
		int result = boardService.insert_board(boardVo);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/board_list.do";
		}else {
			viewPage = "/board_write";
		}return viewPage;
	}

	@GetMapping("/board_list.do")
	public String board_list(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="order_by", defaultValue="order_new") String order_by,
			@RequestParam(value="view", defaultValue="view_frame") String view) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setOrder_by(order_by);
		scri.setView(view);

		int cnt = boardService.board_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> board_list = boardService.board_list(scri);
		model.addAttribute("board_list", board_list);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "/board_list";
	}
	
	@GetMapping("/board_content.do")
	public String board_content(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="order_by", defaultValue="order_new") String order_by, int board_idx, Model model) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setOrder_by(order_by);
		scri.setBoard_idx(board_idx);

		int cnt = boardService.board_reply_total(board_idx);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		boardService.update_hits(board_idx);
		BoardVo boardVo = boardService.board_content(board_idx);
		List<BoardVo> board_reply = boardService.board_reply(scri);
		model.addAttribute("boardVo",boardVo);
		model.addAttribute("board_reply",board_reply);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "/board_content";
	}

	@ResponseBody
	@PostMapping("/insert_reply.do")
	public int insert_reply(BoardVo boardVo,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx,
			@RequestParam(value="board_code", defaultValue="0") String board_code,
			@RequestParam(value="board_content", defaultValue="") String board_content,
			@RequestParam(value="board_writer", defaultValue="writer") String board_writer) throws IOException {
		
		String board_ip = InetAddress.getLocalHost().getHostAddress();
		
		boardVo.setBoard_code(board_code);
		boardVo.setBoard_content(board_content);
		boardVo.setBoard_ip(board_ip);
		boardVo.setBoard_originidx(board_idx);
		boardVo.setBoard_writer(board_writer);
		
		int result = boardService.insert_reply(boardVo);
		boardService.update_reply(board_idx);
		
		return result;
	}
	
	@GetMapping("/delete_board.do")
	public String delete_board(int board_idx) {

		int result = boardService.delete_board(board_idx);
		
		String viewPage = null;
		if(result==1) {
			viewPage = "redirect:/board_list.do";
		}else {
			viewPage = "/board_content.do?board_idx="+board_idx;
		}return viewPage;
	}
	
	@GetMapping("/board_modify.do")
	public String board_modify(int board_idx, Model model) {
		
		BoardVo boardVo = boardService.board_modify_content(board_idx);
		model.addAttribute("boardVo",boardVo);
		
		return "board_modify";
	}
	
	@PostMapping("/modify_board.do")
	public String modify_board(BoardVo boardVo) throws IOException {

		String ip = InetAddress.getLocalHost().getHostAddress();
        boardVo.setBoard_ip(ip);
        
        // board_content 에서 HTML 태그 제거
        String board_remove_tag = boardVo.getBoard_content().replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
        boardVo.setBoard_remove_tag(board_remove_tag);
        
		// 이미지 태그를 추출
		Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		String content = boardVo.getBoard_content();
		Matcher match = pattern.matcher(content);
		String image = null;
		
		if(match.find()) {
			image = match.group(0);
			boardVo.setBoard_image(image);
		}
		
		int board_idx = +boardVo.getBoard_idx();
		
		boardService.modify_board(boardVo);
		
		return "redirect:/board_content.do?board_idx="+board_idx;
	}
	
	@ResponseBody
	@PostMapping("/update_like.do")
	public int update_like(BoardVo boardVo,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx,
			@RequestParam(value="board_like", defaultValue="0") int board_like) {
		
		boardVo.setBoard_idx(board_idx);
		boardVo.setBoard_like(board_like);
		
		int result = boardService.update_like(boardVo);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/like_count.do")
	public int like_count(@RequestParam(value="board_idx", defaultValue="0") int board_idx) {
		
		int result = boardService.like_count(board_idx);
		
		return result;
	}
	
}