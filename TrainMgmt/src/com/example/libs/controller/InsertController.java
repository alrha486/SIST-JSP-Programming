package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.CustomerDAO;
import com.example.libs.model.CustomerVO;

public class InsertController {	
	public int insert(CustomerVO custom) {
		int row = 0;
		try {
			Calc calc = new Calc(custom);
			calc.calc();
			row = CustomerDAO.insertData(custom);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return row;
	}
}
