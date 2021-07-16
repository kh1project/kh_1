package com.web.seenema.line.dto;

public class SettingDataDTO {
	private int mid;
	private int startNum;
	private int endNum;
	
	public SettingDataDTO(int mid, int startNum, int endNum) {
		this.mid = mid;
		this.startNum = startNum;
		this.endNum = endNum;
	}
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public int getStartNum() {
		return startNum;
	}
	
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	public int getEndNum() {
		return endNum;
	}
	
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
}
