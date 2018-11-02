package com.example.libs.model;

public class EmployeeDTO {
	private String sabun;
	private int hobong;
	private int night_hour;
	private int family;
	private String dname;
	private int gibon;
	private int jsudang;
	private int nsudang;
	private int fsudang;
	private int total;
	private int tax;
	private int salary;
	public EmployeeDTO() {}   // useBean용 생성자
	public EmployeeDTO(String sabun, int hobong, int night_hour, int family) { //입력용 생성자
		this.sabun = sabun;
		this.hobong = hobong;
		this.night_hour = night_hour;
		this.family = family;
	}
	public EmployeeDTO(String sabun, String dname, int gibon, int jsudang, int nsudang, int fsudang, int total, int tax,
			int salary) {   //출력용 생성자
		this.sabun = sabun;
		this.dname = dname;
		this.gibon = gibon;
		this.jsudang = jsudang;
		this.nsudang = nsudang;
		this.fsudang = fsudang;
		this.total = total;
		this.tax = tax;
		this.salary = salary;
	}
	public String getSabun() {
		return sabun;
	}
	public void setSabun(String sabun) {
		this.sabun = sabun;
	}
	public int getHobong() {
		return hobong;
	}
	public void setHobong(int hobong) {
		this.hobong = hobong;
	}
	public int getNight_hour() {
		return night_hour;
	}
	public void setNight_hour(int night_hour) {
		this.night_hour = night_hour;
	}
	public int getFamily() {
		return family;
	}
	public void setFamily(int family) {
		this.family = family;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getGibon() {
		return gibon;
	}
	public void setGibon(int gibon) {
		this.gibon = gibon;
	}
	public int getJsudang() {
		return jsudang;
	}
	public void setJsudang(int jsudang) {
		this.jsudang = jsudang;
	}
	public int getNsudang() {
		return nsudang;
	}
	public void setNsudang(int nsudang) {
		this.nsudang = nsudang;
	}
	public int getFsudang() {
		return fsudang;
	}
	public void setFsudang(int fsudang) {
		this.fsudang = fsudang;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTax() {
		return tax;
	}
	public void setTax(int tax) {
		this.tax = tax;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
}
