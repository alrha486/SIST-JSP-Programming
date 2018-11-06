package com.example.libs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	//-1 : 그런 아이디 없다., 0 : 아이디는 있으나 비밀번호가 불일치한다. , 1 : 모두 맞다.
	public static int userLogin(String userid, String userpasswd) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT userpasswd FROM Member WHERE userid = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		int flag = -2;
		if(!rs.next())  flag = -1;    //그런 아이디가 아예 없었다면
		else {   //아이디는 있다.
			String dbpwd = rs.getString("userpasswd");
			if(dbpwd.trim().equals(userpasswd.trim()))  flag = 1;
			else flag = 0;
		}
		DBClose.close(conn);
		return flag;
	}
}




