package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class CustomerDAO {
	public static void deleteTable(Statement stmt) throws SQLException{
		StringBuffer sb = new StringBuffer("DROP TABLE Customer");
		stmt.executeUpdate(sb.toString());
	}
	public static void deleteSequence(Statement stmt) throws SQLException {
		StringBuffer sb = new StringBuffer("DROP SEQUENCE customer_id_seq");
		stmt.executeUpdate(sb.toString());
	}
	public static void createTable(Statement stmt) throws SQLException{
		StringBuffer sb = new StringBuffer();
		sb.append("CREATE TABLE Customer");
		sb.append("(");
		sb.append("	id	NUMBER(4)	PRIMARY KEY,");
		sb.append("    tscode	char(4), ");
		sb.append("    pcode	CHAR(2),");
		sb.append("    jumin1	CHAR(6),");
		sb.append("    jumin2	CHAR(7),");
		sb.append("    ppcode	CHAR(2),");
		sb.append("    region	VARCHAR2(10),");
		sb.append("    gender	VARCHAR2(5),");
		sb.append("    tname	VARCHAR2(20),");
		sb.append("    sname	VARCHAR2(20),");
		sb.append("    kind	VARCHAR2(20),");
		sb.append("    price	NUMBER(5),");
		sb.append("    charge	NUMBER(10)");
		sb.append(")");
		stmt.executeUpdate(sb.toString());
	}
	public static void createSequence(Statement stmt) throws SQLException {
		StringBuffer sb = new StringBuffer();
		sb = new StringBuffer();
		sb.append("CREATE SEQUENCE customer_id_seq");
		sb.append("   MAXVALUE    999");
		stmt.executeUpdate(sb.toString());
	}
	public static void initDB() throws SQLException{
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT table_name FROM user_tables ");
		sb.append("WHERE table_name = upper('customer')");
		ResultSet rs = stmt.executeQuery(sb.toString());
		if(rs.next()) deleteTable(stmt);
		else createTable(stmt);
		rs.close(); 
		
		sb = new StringBuffer();
		sb.append("SELECT sequence_name FROM user_sequences ");
		sb.append("WHERE sequence_name = upper('customer_id_seq')");
		rs = stmt.executeQuery(sb.toString());
		if(rs.next()) deleteSequence(stmt);
		else createSequence(stmt);
		rs.close();
		stmt.close();
	}
	public static int insertData(CustomerVO customer) throws SQLException{
		Connection conn = DBConnection.getConnection();
		StringBuffer sb = new StringBuffer("INSERT INTO CUSTOMER(id, tscode, pcode, jumin1, jumin2, ppcode, ");
		sb.append("region, gender, tname, sname, kind, price, charge) ");
		sb.append(" VALUES (CUSTOMER_ID_SEQ.NEXTVAL, ?,?,?,?,?,?,?,?,?,?,?,?)");
		PreparedStatement pstmt =conn.prepareStatement(sb.toString());
		pstmt.setString(1, customer.getTscode());
		pstmt.setString(2, customer.getPcode());
		pstmt.setString(3, customer.getJumin1());
		pstmt.setString(4, customer.getJumin2());
		pstmt.setString(5, customer.getPpcode());
		pstmt.setString(6, customer.getRegion());
		pstmt.setString(7, customer.getGender());
		pstmt.setString(8, customer.getTname());
		pstmt.setString(9, customer.getSname());
		pstmt.setString(10, customer.getKind());
		pstmt.setInt(11, customer.getPrice());
		pstmt.setInt(12, customer.getCharge());
		int row = pstmt.executeUpdate();
		pstmt.close();
		return row;
	}
	public static Map<String, Object> getPnameKuri(String code) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT pname, kuri FROM place WHERE code = ?";
		PreparedStatement pstmt = conn.prepareCall(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String pname = rs.getString("pname");    //장소명
		int kuri = rs.getInt("kuri");                     //거리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pname", pname);
		map.put("kuri", kuri);
		rs.close();   pstmt.close();
		return map;
	}
	public static String getTname(String code) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT tname FROM train WHERE code = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		rs.next();   
		String tname = rs.getString("tname");   //기차명
		rs.close();   pstmt.close();
		return tname;
	}
	public static String getSname(String code) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT sname FROM seat WHERE code = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String sname = rs.getString("sname");      //좌석명
		rs.close();   pstmt.close();
		return sname;
	}
	public static Map<String, Object> getKindRate(String code) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT kind,rate FROM premium WHERE code = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String kind = rs.getString("kind");   //할증종류
		double rate = rs.getDouble("rate");   //할인율
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("rate", rate);
		rs.close();   pstmt.close();
		return map;
	}
	public static int getDanga(String tname, String sname) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT danga FROM price WHERE tname = ? and sname = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tname);
		pstmt.setString(2, sname);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int danga = rs.getInt("danga");
		rs.close();   pstmt.close();
		return danga;
	}
}
