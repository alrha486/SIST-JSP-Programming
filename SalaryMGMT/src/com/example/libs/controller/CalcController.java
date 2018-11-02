package com.example.libs.controller;

import com.example.libs.model.EmployeeDTO;

public class CalcController {
	private SelectController select;
	public CalcController() {   //Constructor
		select = new SelectController();
	}
	public void calc(EmployeeDTO emp) {
		String sabun = emp.getSabun();
		String dname = this.select.select(sabun.charAt(0));
		emp.setDname(dname);
		int gibon = emp.getHobong() * 10000;
		emp.setGibon(gibon);
		int nsudang = emp.getNight_hour() * 15000;
		emp.setNsudang(nsudang);
		int fsudang = emp.getFamily() * 15000;
		emp.setFsudang(fsudang);
		int s_money = this.select.select(Integer.parseInt(String.valueOf(sabun.charAt(1))));
		emp.setJsudang(s_money);
		int total = gibon + nsudang + fsudang + s_money;
		emp.setTotal(total);
		int tax = (int)(total * 0.1);
		emp.setTax(tax);
		int salary = total - tax;
		emp.setSalary(salary);
	}
}
