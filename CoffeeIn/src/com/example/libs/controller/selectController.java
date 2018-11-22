package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.MemberDAO;
import com.example.libs.model.MemberVO;

public class selectController {
	
	// 유저 한명의 데이터 전체조회(회원 id로)
	public static MemberVO selectMember(String userid) { 
		MemberVO member = null;
		
		try {
			member = MemberDAO.selectMember(userid);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return member; // 한 멤버의 전체 정보가 들어있는 member
	}
	
	// 유저 한명의 데이터 전체조회(회원 이메일로)
		public MemberVO selectMember1(String email) { 
			MemberVO member = null;
			
			try {
				member = MemberDAO.selectMember(email);
			} catch (SQLException e) {
				System.out.println(e);
			}
			return member; // 한 멤버의 전체 정보가 들어있는 member
		}
	
	
	public int loginMember(String userid, String passwd) { // 로그인
		int flag = -1;
		try {
			flag = MemberDAO.loginMember(userid, passwd);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return flag; // 로그인 성공 여부가 들어있는 flag
	}
	

}
