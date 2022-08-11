package we.are.travelers.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import we.are.travelers.service.BoardService;
import we.are.travelers.vo.BoardLikeVo;
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
	public Map<String, Object> imgUpload(@RequestParam("upload") MultipartFile img, HttpSession session, HttpServletRequest request) {
		return BoardService.uploadImg(img, session, request);
	}
	
	// board
	@GetMapping("/board_write.do")
	public String board_write(@RequestParam(value="code", defaultValue="") String code, Model model) {
		
		model.addAttribute("code", code);
		
		return "board/board_write";
	}
	
	@PostMapping("/insert_board.do")
	public String insert_board(BoardVo boardVo, @RequestParam(value="code", defaultValue="") String code, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		boardVo.setMember_idx((String)session.getAttribute("member_idx"));
		boardVo.setBoard_writer((String) session.getAttribute("member_nick"));
        boardVo.setBoard_ip(InetAddress.getLocalHost().getHostAddress());
        boardVo.setBoard_code(code);
        
        // board_subject 에서 HTML 태그 변환
        String subject = boardVo.getBoard_subject();
        String board_subject = HtmlUtils.htmlEscape(subject);
        boardVo.setBoard_subject("<pre>"+board_subject+"</pre>");
        
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
		
		String category = code.substring(0, 1);
		String viewPage = "";

		if(result==1) {
			if(("n").equals(category)) {
				viewPage = "redirect:/notice_list.do?code="+code;
			}else if(("b").equals(category)) {
				viewPage = "redirect:/board_list.do?code="+code;
			}else if(("m").equals(category)) {
				viewPage = "redirect:/inquiry_list.do";
			}else if(("c").equals(category)) {
				viewPage = "redirect:/inquiry_list.do";
			}
		}else {
			viewPage = "board/board_write";
		}return viewPage;
	}

	@GetMapping("/board_list.do")
	public String board_list(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="order_by", defaultValue="order_new") String order_by,
			@RequestParam(value="view", defaultValue="view_frame") String view,
			@RequestParam(value="my_board", defaultValue="") String my_board,
			@RequestParam(value="code") String code) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setOrder_by(order_by);
		scri.setView(view);
		scri.setMy_board(my_board);
		scri.setBoard_code(code);
		
		int cnt = boardService.board_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> board_list = boardService.board_list(scri);
		model.addAttribute("board_list", board_list);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "board/board_list";
	}
	
	@GetMapping("/board_content.do")
	public String board_content(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="order_by", defaultValue="order_new") String order_by,
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx, BoardLikeVo boardLikeVo, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		boardLikeVo.setBoard_idx(board_idx);
		boardLikeVo.setMember_idx((String) session.getAttribute("member_idx"));
		
		int likeyn = boardService.select_like_count(boardLikeVo);
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setOrder_by(order_by);
		scri.setBoard_idx(board_idx);
		scri.setBoard_code(code);

		int cnt = boardService.board_reply_total(board_idx);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		boardService.update_hits(board_idx);
		BoardVo boardVo = boardService.board_content(board_idx);
		List<BoardVo> board_reply = boardService.board_reply(scri);
		
		model.addAttribute("boardVo",boardVo);
		model.addAttribute("likeyn",likeyn);
		model.addAttribute("board_reply",board_reply);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "board/board_content";
	}
	
	// notice
	@GetMapping("/notice_list.do")
	public String notice_list(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="order_by", defaultValue="order_new") String order_by,
			@RequestParam(value="view", defaultValue="view_frame") String view,
			@RequestParam(value="my_board", defaultValue="") String my_board,
			@RequestParam(value="code", defaultValue="") String code) {
			
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setOrder_by(order_by);
		scri.setView(view);
		scri.setMy_board(my_board);
		scri.setBoard_code(code);
		
		int cnt = boardService.board_total(scri);
			
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> board_list = boardService.board_list(scri);
		model.addAttribute("board_list", board_list);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "board/notice_list";
	}
		
	@GetMapping("/notice_content.do")
	public String notice_content(int board_idx, Model model) {
			
		boardService.update_hits(board_idx);
		BoardVo boardVo = boardService.board_content(board_idx);
		model.addAttribute("boardVo",boardVo);
			
		return "board/notice_content";
	}
		
	// inquiry
	@GetMapping("/inquiry_write.do")
	public String inquiry_write() {
		return "board/inquiry_write";
	}
		
	@GetMapping("/inquiry_list.do")
	public String inquiry_list(Model model,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="code", defaultValue="") String code, HttpServletRequest request) {
			
		HttpSession session = request.getSession();
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setBoard_code(code);
		scri.setMy_board((String) session.getAttribute("member_nick"));
	
		int cnt = boardService.inquiry_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> inquiry_list = boardService.inquiry_list(scri);
		model.addAttribute("inquiry_list", inquiry_list);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "board/inquiry_list";
	}
	
	@GetMapping("/inquiry_content.do")
	public String inquiry_content(
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx, Model model) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setBoard_idx(board_idx);
		scri.setBoard_code(code);

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
		
		return "board/inquiry_content";
	}

	@ResponseBody
	@PostMapping("/insert_reply.do")
	public int insert_reply(BoardVo boardVo,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx,
			@RequestParam(value="board_content", defaultValue="") String board_content,
			@RequestParam(value="board_code", defaultValue="") String board_code, HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		
		// board_content 에서 HTML 태그 변환
        String content = HtmlUtils.htmlEscape(board_content);
        boardVo.setBoard_content("<pre>"+content+"</pre>");
        
        boardVo.setBoard_code(board_code);
		boardVo.setBoard_originidx(board_idx);
		boardVo.setBoard_writer((String) session.getAttribute("member_nick"));
        boardVo.setBoard_ip(InetAddress.getLocalHost().getHostAddress());
        boardVo.setMember_idx((String)session.getAttribute("member_idx"));
        
        int result = boardService.insert_reply(boardVo);
		
		boardVo.setBoard_reply(1);
		boardVo.setBoard_idx(board_idx);
		
		boardService.update_reply(boardVo);
		
		return result;
	}
	
	@GetMapping("/delete_reply.do")
	public String delete_reply(BoardVo boardVo, int board_idx, int board_originidx, String code) {

		boardVo.setBoard_reply(0);
		boardVo.setBoard_idx(board_originidx);
		
		boardService.delete_reply(board_idx);
		boardService.update_reply(boardVo);
		
		String viewPage = "";
		
		if(code==null) {
			viewPage = "redirect:/board_content.do?board_idx="+board_originidx;
		}else if(code!=null) {
			viewPage = "redirect:/inquiry_content.do?board_idx="+board_originidx;
		}return viewPage;
	}
	
	@ResponseBody
	@PostMapping("/modify_reply.do")
	public int modify_reply(BoardVo boardVo,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx,
			@RequestParam(value="board_content", defaultValue="") String board_content,
			@RequestParam(value="board_code", defaultValue="") String board_code, HttpServletRequest request) throws IOException {
		
		HttpSession session = request.getSession();
		
		boardVo.setBoard_content(board_content);
        boardVo.setBoard_ip(InetAddress.getLocalHost().getHostAddress());
        boardVo.setMember_idx((String)session.getAttribute("member_idx"));
        
        int result = boardService.modify_reply(boardVo);
		
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
	public String board_modify(@RequestParam(value="code", defaultValue="") String code, int board_idx, Model model) {
		
		BoardVo boardVo = boardService.board_content(board_idx);
		model.addAttribute("boardVo",boardVo);
		model.addAttribute("code",code);
		
		return "board/board_modify";
	}
	
	@PostMapping("/modify_board.do")
	public String modify_board(@RequestParam(value="code", defaultValue="") String code, BoardVo boardVo) throws IOException {

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
		
		String category = code.substring(0, 1);
		String viewPage = null;
		
		if(category.equals("n")) {
			viewPage = "redirect:/notice_content.do?board_idx="+board_idx;
		}else if(category.equals("b")) {
			viewPage = "redirect:/board_content.do?board_idx="+board_idx;
		}
		if(("n").equals(category)) {
			viewPage = "redirect:/notice_content.do?board_idx="+board_idx;
		}else if(("b").equals(category)) {
			viewPage = "redirect:/board_content.do?board_idx="+board_idx;
		}else if(("m").equals(category)) {
			viewPage = "redirect:/inquiry_content.do?board_idx="+board_idx;
		}else if(("c").equals(category)) {
			viewPage = "redirect:/inquiry_content.do?board_idx="+board_idx;
		}return viewPage;
	}
	
	@ResponseBody
	@PostMapping("/update_like.do")
	public int update_like(BoardVo boardVo, BoardLikeVo boardLikeVo,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx,
			@RequestParam(value="board_like", defaultValue="0") int board_like, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String member_idx = (String) session.getAttribute("member_idx");
		
		boardVo.setBoard_idx(board_idx);
		boardVo.setBoard_like(board_like);
		
		boardLikeVo.setBoard_idx(board_idx);
		boardLikeVo.setMember_idx(member_idx);
		
		int result = boardService.update_like(boardVo);
		
		if(board_like==1) {
			boardService.insert_board_like(boardLikeVo);
		}else if (board_like!=1) {
			boardService.delete_board_like(boardLikeVo);
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/like_count.do")
	public int like_count(@RequestParam(value="board_idx", defaultValue="0") int board_idx) {
		
		int result = boardService.like_count(board_idx);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/modify_delyn.do")
	public int modify_delyn(BoardVo boardVo, @RequestParam(value="board_idx") int board_idx, @RequestParam(value="board_delyn") String board_delyn) {
		
		boardVo.setBoard_idx(board_idx);
		boardVo.setBoard_delyn(board_delyn);
		
		int result = boardService.modify_delyn(boardVo);
		
		return result;
	}
	
	@GetMapping("/admin_board_content.do")
	public String admin_board_content(
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="order_by", defaultValue="order_new") String order_by,
			@RequestParam(value="code", defaultValue="") String code,
			@RequestParam(value="board_idx", defaultValue="0") int board_idx, BoardLikeVo boardLikeVo, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		boardLikeVo.setBoard_idx(board_idx);
		boardLikeVo.setMember_idx((String) session.getAttribute("member_idx"));
		
		int likeyn = boardService.select_like_count(boardLikeVo);
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setOrder_by(order_by);
		scri.setBoard_idx(board_idx);
		scri.setBoard_code(code);

		int cnt = boardService.board_reply_total(board_idx);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		boardService.update_hits(board_idx);
		BoardVo boardVo = boardService.admin_board_content(board_idx);
		List<BoardVo> board_reply = boardService.board_reply(scri);
		
		model.addAttribute("boardVo",boardVo);
		model.addAttribute("likeyn",likeyn);
		model.addAttribute("board_reply",board_reply);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "board/board_content";
	}
	
}