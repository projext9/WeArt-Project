package we.are.travelers.vo;

public class SearchCriteria extends Criteria {

	private String searchType;
	private String keyword;
	private String order_by;
	private String view;
	private int board_idx;
	private String my_board;
	private String board_code;

	public SearchCriteria() {
		this.searchType = "";
		this.keyword = "";
		this.order_by = "";
		this.view = "";
		this.board_idx = 0;
		this.my_board = "";
		this.board_code = "";
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOrder_by() {
		return order_by;
	}
	public void setOrder_by(String order_by) {
		this.order_by = order_by;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getMy_board() {
		return my_board;
	}
	public void setMy_board(String my_board) {
		this.my_board = my_board;
	}
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	
}