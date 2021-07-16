package com.web.seenema.reserve.dto;

public class BranchDTO {
	private int id;
	private String location;	// 지역명
	private String name;		// 지점명
	private int cntByloc;
	
	public String toString() {
		return "지역명 : " + this.getLocation() + " 지점명 : " + this.getName();
	}
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getCntByloc() {
		return cntByloc;
	}
	
	public void setCntByloc(int cntByloc) {
		this.cntByloc = cntByloc;
	}
	
}
