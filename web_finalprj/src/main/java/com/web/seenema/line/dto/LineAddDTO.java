package com.web.seenema.line.dto;

public class LineAddDTO {
	private int id;
	private int mid;
	private int aid;
	private int star;
	private String contents;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public int getAid() {
		return aid;
	}
	
	public void setAid(int aid) {
		this.aid = aid;
	}
	
	public int getStar() {
		return star;
	}
	
	public void setStar(int star) {
		this.star = star;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
}
