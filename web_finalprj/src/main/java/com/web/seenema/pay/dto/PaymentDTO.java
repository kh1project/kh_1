package com.web.seenema.pay.dto;

public class PaymentDTO {
	private String movieid;
	private String movie_theater;
	private String peple;
	private String seat;
	private char seatrow;
	private int seatcol;
	private String total;
	private String methodPay;
	
	public String getMovieid() {
		return movieid;
	}
	
	public void setMovieid(String movieid) {
		this.movieid = movieid;
	}
	
	public String getMovie_theater() {
		return movie_theater;
	}
	
	public void setMovie_theater(String movie_theater) {
		this.movie_theater = movie_theater;
	}
	
	public String getPeple() {
		return peple;
	}
	
	public void setPeple(String peple) {
		this.peple = peple;
	}
	
	public String getSeat() {
		return seat;
	}
	
	public void setSeat(String seat) {
		this.seat = seat;
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
	
	public String getTotal() {
		return total;
	}
	
	public void setTotal(String total) {
		this.total = total;
	}
	
	public String getMethodPay() {
		return methodPay;
	}
	
	public void setMethodPay(String methodPay) {
		this.methodPay = methodPay;
	}
}
