package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO { // data access object DAO
	
	// 회원 정보 수정 
	public static int updateMember(MemberVO member) throws SQLException{
		Connection conn = DBConnection.getConnection(); // member.jocl
		String sql = "{ call member_update(?,?,?,?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getEmail());
		cstmt.setString(3, member.getZipcode());
		cstmt.setString(4, member.getAddress1());
		cstmt.setString(5, member.getAddress2());
		int row = cstmt.executeUpdate();
		
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		
		return row; // 회원 수정 성공 시 1을 리턴 
	}
	
	// 회원 탈퇴(삭제)
	public static int deleteMember(String userid) throws SQLException{
		Connection conn = DBConnection.getConnection(); // member.jocl
		String sql = "{ call member_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		int row = cstmt.executeUpdate();
		
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		
		return row; // 삭제 성공 시 1을 리턴 
	}
	
	
	// 유저ID로 전체정보 가져오기(회원ID로)
	public static MemberVO selectMember(String userid) throws SQLException{ 
		Connection conn = DBConnection.getConnection(); 
		String sql = "{ call member_select(?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		
		MemberVO member = new MemberVO(
				rs.getString("username"),rs.getString("usernickname") ,rs.getString("userid"),
				rs.getString("passwd"), rs.getString("email"),rs.getString("tel"),
				rs.getString("zipcode"), rs.getString("address1"),
				rs.getString("address2")
		);
		
		if(cstmt != null) cstmt.close();
		if(rs != null) rs.close();
		DBClose.close(conn);
		
		return member;
	}
	
	// 유저ID로 전체정보 가져오기(회원email로)
		public static MemberVO selectMember1(String email) throws SQLException{ 
			Connection conn = DBConnection.getConnection(); 
			String sql = "{ call member_select1(?,?) }";
			CallableStatement cstmt = conn.prepareCall(sql);
			cstmt.setString(1, email);
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.executeUpdate();
			ResultSet rs = (ResultSet)cstmt.getObject(2);
			rs.next();
			
			MemberVO member = new MemberVO(
					rs.getString("username"), rs.getString("usernickname"),rs.getString("userid"),
					rs.getString("passwd"), rs.getString("email"),rs.getString("tel"),
					rs.getString("zipcode"), rs.getString("address1"),
					rs.getString("address2")
			);
			
			if(cstmt != null) cstmt.close();
			if(rs != null) rs.close();
			DBClose.close(conn);
			
			return member;
		}
	
	
	
	//로그인
	public static int loginMember(String userid, String passwd) throws SQLException{ 
		// -1: No account /0: not equals password/ 1: success 
		Connection conn = DBConnection.getConnection(); // member.jocl
		String sql = "{ call member_login(?,?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, userid);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();
		ResultSet rs = (ResultSet)cstmt.getObject(2);// cursor
		int row = -1;
		if(!rs.next()) row = -1; // 유저 아이디 자체가 일치하는 놈이 없으면
		else { // 일단 계정은 있다.
			if(passwd.trim().equals(rs.getString("passwd"))) {
				row = 1; // ID, PWD 둘다 일치
			}else {
				row = 0; // 비밀번호만 불일치
			}
		}
		
		if(cstmt != null) cstmt.close();
		if(rs != null) rs.close();
		DBClose.close(conn);
		
		return row;
	}
	
	// 네이버, 카카오톡 로그인
	public static int kakaoMember(MemberVO member) throws SQLException {  
		// 값이 세팅 된 MemberVO 형 member 가 넘어옴 7개의 데이터 
		Connection conn = DBConnection.getConnection(); // member.jocl
		String sql = "{ call kakao_insert(?,?,?,?,?) }"; // 카카오 회원가입 전용 프로시저로 바꾸고 DB생성 
		// Callable Statement >> call 프로시듀어 명 
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getUsername());
		cstmt.setString(3, member.getUsernickname());
		cstmt.setString(4, member.getEmail());
		cstmt.setString(5, member.getTel());

		int row = cstmt.executeUpdate();
		
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	
	
	
	// 회원가입 
	public static int insertMember(MemberVO member) throws SQLException {  
		// 값이 세팅 된 MemberVO 형 member 가 넘어옴 7개의 데이터 
		Connection conn = DBConnection.getConnection(); // member.jocl
		String sql = "{ call member_insert(?,?,?,?,?,?,?,?,?) }";
		// Callable Statement >> call 프로시듀어 명 
		CallableStatement cstmt = conn.prepareCall(sql);

		cstmt.setString(1, member.getUserid());
		cstmt.setString(2, member.getPasswd());
		cstmt.setString(3, member.getUsername());
		cstmt.setString(4, member.getUsernickname());
		cstmt.setString(5, member.getEmail());
		cstmt.setString(6, member.getTel());
		cstmt.setString(7, member.getZipcode());
		cstmt.setString(8, member.getAddress1());
		cstmt.setString(9, member.getAddress2());
		int row = cstmt.executeUpdate();
		
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	
	
	
}










