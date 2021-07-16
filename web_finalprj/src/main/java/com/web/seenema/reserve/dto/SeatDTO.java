package com.web.seenema.reserve.dto;

public class SeatDTO {
	private int id;
	private int tid;
	private char seatrow;
	private int seatcol;
	private char reserved;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getTid() {
		return tid;
	}
	
	public void setTid(int tid) {
		this.tid = tid;
	}
	
	public char getSeatrow() {
		return seatrow;
	}
	
	public void setSeatrow(char seatrow) {
		this.seatrow = seatrow;
	}
	
	public int getSeatcol() {
		return seatcol;
	}
	
	public void setSeatcol(int seatcol) {
		this.seatcol = seatcol;
	}
	
	public char getReserved() {
		return reserved;
	}
	
	public void setReserved(char reserved) {
		this.reserved = reserved;
	}
	
}
