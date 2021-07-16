package com.web.seenema.line.dto;

import java.util.List;

public class PagingInfoDTO {
	private int totalrow;
	private int max_page;
	
	public int getTotalrow() {
		return totalrow;
	}
	public void setTotalrow(int totalrow) {
		this.totalrow = totalrow;
	}
	public int getMax_page() {
		return max_page;
	}
	public void setMax_page(int max_page) {
		this.max_page = max_page;
	}
}
