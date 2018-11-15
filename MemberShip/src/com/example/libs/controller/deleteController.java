package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;

public class deleteController {

		// 유저 삭제 
		public int deleteMember(String userid) {
			int row = -1;
			
			try {
				row = MemberDAO.deleteMember(userid);
			} catch (SQLException e) {
				System.out.println(e);
			}
			return row;
		}
}
