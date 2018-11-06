package com.example.libs;

import java.sql.SQLException;



public class SelectController {
	public int userLogin(String userid, String userpasswd) {
		int flag = -2;
		try {
			flag = MemberDAO.userLogin(userid, userpasswd);
		}catch(SQLException ex) {
			System.out.println(ex);
		}
		return flag;
	}

}
