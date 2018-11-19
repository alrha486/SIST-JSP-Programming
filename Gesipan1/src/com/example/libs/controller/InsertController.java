package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class InsertController {
	public int insert(GesipanVO gesipan) {
		int row = 0;
		try {
			row = GesipanDAO.insert(gesipan);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
