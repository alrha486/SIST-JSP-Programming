package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.GesipanDAO;

public class DeleteController {
	public int delete(int idx) {
		int row = 0;
		try {
			row = GesipanDAO.delete(idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
