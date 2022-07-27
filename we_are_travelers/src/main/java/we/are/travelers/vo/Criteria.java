package we.are.travelers.vo;

public class Criteria {

	private int page;
	private int perPageNum;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 12;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if (page<=1) {
			this.page = 1;
			return;
		}this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
}