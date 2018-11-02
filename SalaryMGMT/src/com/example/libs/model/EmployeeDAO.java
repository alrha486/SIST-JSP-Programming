package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class EmployeeDAO {
	public static Vector<EmployeeDTO> select() throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM Employee ORDER BY salary DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs= pstmt.executeQuery();
		Vector<EmployeeDTO> vector = new Vector<EmployeeDTO>(1,1);
		if(!rs.next()) {  //한 개의 데이터도 없다면
			vector = null;
		}else {
			do {
				EmployeeDTO emp = new EmployeeDTO(rs.getString("sabun"),
						rs.getString("dname"), rs.getInt("gibon"), rs.getInt("jsudang"), 
						rs.getInt("nsudang"), rs.getInt("fsudang"), rs.getInt("total"),
						rs.getInt("tax"), rs.getInt("salary"));
				vector.add(emp);
			}while(rs.next());
		}
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close(); 
		DBClose.close(conn);
		return vector;
	}
	public static int select(int grade) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT s_money FROM Salary WHERE s_grade = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, grade);
		ResultSet rs= pstmt.executeQuery();
		rs.next();
		int s_money = rs.getInt("s_money");
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close(); 
		DBClose.close(conn);
		return s_money;
	}
	public static String select(char code) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT dname FROM Department WHERE d_code = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, String.valueOf(code));
		ResultSet rs= pstmt.executeQuery();
		rs.next();
		String dname = rs.getString("dname");
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close(); 
		DBClose.close(conn);
		return dname;
	}
	public static int insert(EmployeeDTO emp) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO Employee VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, emp.getSabun());
		pstmt.setInt(2, emp.getHobong());
		pstmt.setInt(3, emp.getNight_hour());
		pstmt.setInt(4, emp.getFamily());
		pstmt.setString(5, emp.getDname());
		pstmt.setInt(6, emp.getGibon());
		pstmt.setInt(7, emp.getJsudang());
		pstmt.setInt(8, emp.getNsudang());
		pstmt.setInt(9, emp.getFsudang());
		pstmt.setInt(10, emp.getTotal());
		pstmt.setInt(11, emp.getTax());
		pstmt.setInt(12, emp.getSalary());
		int row = pstmt.executeUpdate();
		if(pstmt != null) pstmt.close();
		DBClose.close(conn);
		return row;
	}
}
