package com.example.libs.model;

import java.util.Date;

public class MemberVO {
	private int idx;
	private String username;
	private String userid;
	private String passwd;
	private String email;
	private Date regdate;
	private String zipcode;
	private String address1;
	private String address2;
	
	public MemberVO() { 
	}// 디폴트생성자		
	
	public MemberVO(String username, String userid, String passwd, String email, Date regdate) { 
		this.username = username;
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
		this.regdate = regdate;
	}// 필수입력 생성자


	public MemberVO(String username, String userid, String passwd, String email, String zipcode,
			String address1, String address2) {
		this.username = username;
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
	} // 다 집어넣는 생성자

	public Date getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	
}
