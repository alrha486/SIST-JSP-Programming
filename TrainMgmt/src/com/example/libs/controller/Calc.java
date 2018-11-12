package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Map;

import com.example.libs.model.CustomerVO;

class Calc {
	private CustomerVO customer;
	Calc(CustomerVO customer){		
		this.customer =customer;
	}
	void calc() throws SQLException {
		Map<String, Object> map = SelectController.getPnameKuri(customer.getPcode());
		customer.setRegion((String)map.get("pname"));
		String gender = (customer.getJumin2().trim().charAt(0) == '1') ? "남자" : "여자";   //성별
		customer.setGender(gender);
		
		String tname = SelectController.getTname(customer.getTscode().trim().substring(0,2));
		customer.setTname(tname);
		
		String sname = SelectController.getSname(customer.getTscode().trim().substring(2));
		customer.setSname(sname);
		
		Map<String,Object> map1 = SelectController.getKindRate(customer.getPpcode());
		customer.setKind((String)map1.get("kind"));
		double rate = (Double)map1.get("rate");
		
		int danga = SelectController.getDanga(tname, sname);   
		int kuri = (Integer)map.get("kuri");
		int price = kuri * danga;               
		int premium = (int)(price * rate);   
		customer.setPrice(premium);
		int charge = price - premium;    
		customer.setCharge(charge);
	}
}
