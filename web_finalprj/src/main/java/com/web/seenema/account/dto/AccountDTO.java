package com.web.seenema.account.dto;

import java.sql.Date;

public class AccountDTO {
	private int id;
	private String email;
	private String password;
	private String username;
	private String nickname;
	private int age;
	private String gender;
	private String phone;
	private Date joindate;
	private Date logindate;
	private Date expiredate;
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public Date getJoindate() {
		return joindate;
	}


	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	public Date getLogindate() {
		return logindate;
	}


	public void setLogindate(Date logindate) {
		this.logindate = logindate;
	}


	public Date getExpiredate() {
		return expiredate;
	}


	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}


	@Override
	public String toString() {
		return "AccountDTO [id=" + id + ", email=" + email + ", username=" + username + ", nickname=" + nickname + "]";
	}

}
