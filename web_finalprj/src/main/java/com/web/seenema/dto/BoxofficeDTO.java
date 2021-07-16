package com.web.seenema.dto;

public class BoxofficeDTO {
	private int id;
	private int gcnt;
	private String summary;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getGcnt() {
		return gcnt;
	}
	
	public void setGcnt(int gcnt) {
		this.gcnt = gcnt;
	}
	
	public String getSummary() {
		return summary;
	}
	
	public void setSummary(String summary) {
		this.summary = summary;
	}
}
