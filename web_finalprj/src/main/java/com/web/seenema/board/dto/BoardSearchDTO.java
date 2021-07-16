package com.web.seenema.board.dto;

public class BoardSearchDTO {
	private int btype;
	private String searchtype;
	private String search;
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public String toString() {
		return "BoardSearchDTO [btype=" + btype + ", searchtype=" + searchtype + ", search=" + search + "]";
	}
}
