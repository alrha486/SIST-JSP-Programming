package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.EmployeeDAO;
import com.example.libs.model.EmployeeDTO;

public class InsertController {
	public int insert(EmployeeDTO emp) {
		int row = 0;
		try {
			row = EmployeeDAO.insert(emp);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
