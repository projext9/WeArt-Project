package we.are.travelers.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import we.are.travelers.service.AdminService;
import we.are.travelers.vo.MemberVo;
import we.are.travelers.vo.BoardVo;
import we.are.travelers.vo.CompanyVo;
import we.are.travelers.vo.OrderVo;
import we.are.travelers.vo.PageMaker;
import we.are.travelers.vo.SearchCriteria;

@Controller
public class AdminController {
	
	private AdminService adminService;
	
	@Autowired //자동 의존 주입: 생성자 방식
	public AdminController(AdminService adminService) {
		this.adminService = adminService;
	}
	
	@GetMapping("/admin.do") //get방식 요청 처리 <!-- admin_home.jsp 호출 -->
	public String adminHome() {
		return "admin/admin_home";
	}
	
	@GetMapping("/memberList.do") //get방식 요청 처리 <!-- admin_memberList.jsp 호출 -->
	public String getMemberList(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="id") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = adminService.member_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<MemberVo> memberList = adminService.getMemberList(scri); //MemberVo를 memberList 라는 이름으로...
		//모델객체에 회원목록을 추가함 //adminService의 getMemberList 메소드 실행
		model.addAttribute("memberList",memberList); //모델객체에 memberList라는 이름으로 저장
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "admin/memberManage/admin_memberList"; //저장된 객체를 여기로 보냅
	}
	
	@GetMapping("/noticeMember.do")
	public String getNoticeMember(Model model,
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = adminService.noticeMemberTotal(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> noticeMember = adminService.getNoticeMember(scri);
		model.addAttribute("noticeMember", noticeMember);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		
		return "admin/memberManage/admin_noticeMember";
	}
	
	@GetMapping("/memberContent.do")
	public String getMemberContent(Model model, String member_idx) {
		
		List<MemberVo> memberContent = adminService.getMemberContent(member_idx);
		model.addAttribute("memberContent", memberContent);
		return "admin/memberManage/admin_memberContent";
	}
	
	/*@GetMapping("/updateMemberDelyn.do")
	public String getUpdateMemberDelyn(Model model, String member_idx) {
		
		List<MemberVo> updateMemberDelyn = adminService.getUpdateMemberDelyn(member_idx);
		model.addAttribute("updateMemberDelyn", updateMemberDelyn);
		return "admin/memberManage/admin_memberContent";
	}*/
	
	@GetMapping("/sellorList.do")
	public String getSellorList(Model model,
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = adminService.sellorTotal(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<CompanyVo> sellorList = adminService.getSellorList(scri);
		model.addAttribute("sellorList",sellorList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		return "admin/sellorManage/admin_sellorList";
	}
	
	@GetMapping("/sellorContent.do")
	public String getSellorContent(Model model, String company_idx) {
		
		List<CompanyVo> sellorContent = adminService.getSellorContent(company_idx);
		model.addAttribute("sellorContent", sellorContent);
		return "admin/sellorManage/admin_sellorContent";
	}
	
	@GetMapping("/outstanding.do")
	public String getOutstanding(Model model,
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		int cnt = adminService.outstandingTotal(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<CompanyVo> outstanding = adminService.getOutstanding(scri);
		model.addAttribute("outstanding", outstanding);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		return "admin/sellorManage/admin_outstanding";
	}
	
	@GetMapping("/boardList.do")
	public String getBoardList(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword, @RequestParam(value="board_code", defaultValue="") String board_code) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		scri.setBoard_code(board_code);
		
		int cnt = adminService.board_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> boardList = adminService.getBoardList(scri);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		return "admin/boardManage/admin_boardList";
	}
	
	@GetMapping("/boardContent.do")
	public String getBoardContent(Model model, String board_idx) {
		
		List<BoardVo> boardContent = adminService.getBoardContent(board_idx);
		model.addAttribute("boardContent", boardContent);
		return "admin/boardManage/admin_boardContent";
	}
	
	@GetMapping("/replyList.do")
	public String getReplyList(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = adminService.reply_total(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> replyList = adminService.getReplyList(scri);
		model.addAttribute("replyList", replyList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		return "admin/replyManage/admin_replyList";
	}
	
	@GetMapping("/orderList.do")
	public String getOrderList(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = adminService.orderTotal(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<OrderVo> orderList = adminService.getOrderList(scri);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		return "admin/memberManage/admin_orderList";
	}
	
	@GetMapping("/noticeSellor.do")
	public String getNoticeSellor(Model model, 
			@RequestParam(value="page", defaultValue="1") int page, @RequestParam(value="searchType", defaultValue="subject") String searchType,
			@RequestParam(value="keyword", defaultValue="") String keyword) {
		
		SearchCriteria scri = new SearchCriteria();
		scri.setPage(page);
		scri.setKeyword(keyword);
		scri.setSearchType(searchType);
		
		int cnt = adminService.noticeSellorTotal(scri);
		
		PageMaker pm = new PageMaker();
		pm.setScri(scri);
		pm.setTotalCount(cnt);
		
		List<BoardVo> noticeSellor = adminService.getNoticeSellor(scri);
		model.addAttribute("noticeSellor", noticeSellor);
		model.addAttribute("pm", pm);
		model.addAttribute("scri", scri);
		return "admin/sellorManage/admin_noticeSellor";
	}
	
	/*
	@GetMapping("/itemList.do")
	public String getItemList(Model model) {
		
		List<ItemtVo> productList = adminService.getItemList();
		
		model.attribute("itemList", itemList);
		
		return "admin/admin_itemList";
	}
	*/
	
	
}
