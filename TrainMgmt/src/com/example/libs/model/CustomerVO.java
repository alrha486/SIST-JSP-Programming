package com.example.libs.model;

public class CustomerVO {
	private int id;
	private String tscode;
	private String pcode;
	private String jumin1;
	private String jumin2;
	private String ppcode;
	private String region;
	private String gender;
	private String tname;
	private String sname;
	private String kind;
	private int price;
	private int charge;
	public CustomerVO(String tscode, String pcode, String jumin1,
			String jumin2, String ppcode) {
		this.tscode = tscode;
		this.pcode = pcode;
		this.jumin1 = jumin1;
		this.jumin2 = jumin2;
		this.ppcode = ppcode;
	}
	public String getTscode() {
		return tscode;
	}
	public void setTscode(String tscode) {
		this.tscode = tscode;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getJumin1() {
		return jumin1;
	}
	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}
	public String getJumin2() {
		return jumin2;
	}
	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}
	public String getPpcode() {
		return ppcode;
	}
	public void setPpcode(String ppcode) {
		this.ppcode = ppcode;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public int getId() {
		return id;
	}
}
