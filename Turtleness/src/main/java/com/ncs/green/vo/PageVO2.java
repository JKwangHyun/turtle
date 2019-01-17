package com.ncs.green.vo;

public class PageVO2 {
	private int currPage; // 현재 Page 번호
	private int perPage = 15; // page 당 출력 Data 갯수
	private int totalCount;  // 전체 Record 갯수
	private int fno; // 출력 하려는 첫번째 rownum
	private int lno; // 출력 하려는 마지막 rownum
	
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}

	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	@Override
	public String toString() {
		return "PageVO [currPage=" + currPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", fno=" + fno + ", lno=" + lno + "]";
	}
	
} // pageVO