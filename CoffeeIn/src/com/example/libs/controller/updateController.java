package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;
import com.example.libs.model.MemberVO;

public class updateController {
	public int updateMember(MemberVO member) {
		int row = -1;
		try {
			row = MemberDAO.updateMember(member);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}
}
