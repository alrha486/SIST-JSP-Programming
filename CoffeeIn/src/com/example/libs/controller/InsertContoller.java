package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;
import com.example.libs.model.MemberVO;

public class InsertContoller {
	
	//카카오 전용 회원가입
	public int kakaoMember(MemberVO member) {
		int row = 0;
		try {
			row = MemberDAO.kakaoMember(member);
		}catch(SQLException e) {
			System.out.println(e);
		}		
		return row;
	}
	
	//일반 회원가입 
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
