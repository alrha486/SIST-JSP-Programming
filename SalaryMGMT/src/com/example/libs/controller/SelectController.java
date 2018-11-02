package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.EmployeeDAO;
import com.example.libs.model.EmployeeDTO;

public class SelectController {
	public Vector<EmployeeDTO> select(){
		Vector<EmployeeDTO> vector = null;
		try {
			vector = EmployeeDAO.select();
		} catch (SQLException e) {
			System.out.println(e);
		}
		return vector;
	}
	public String select(char code) {
		String dname = null;
		try {
			dname = EmployeeDAO.select(code);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return dname;
	}
	public int select(int grade) {
		int s_money = 0;
		try {
			s_money = EmployeeDAO.select(grade);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return s_money;
	}
}
