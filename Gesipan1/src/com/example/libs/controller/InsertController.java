package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class InsertController {
	// 새로운 글 입력
	public int insert(GesipanVO gesipan) {
		int row = 0;
		try {
			row = GesipanDAO.insert(gesipan);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
	
	//	답 글 입력
	public int insertReply(GesipanVO gesipan) {
		int row = 0;
		try {
			row = GesipanDAO.insertReply(gesipan);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
