package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;
import com.example.libs.model.MemberVO;

public class InsertContoller {
	public int insertMember(MemberVO member) {
		int row = 0;
		try {
			row = MemberDAO.insertMember(member);
		}catch(SQLException e) {
			System.out.println(e);
		}
		
		return row;
		
	}
}
