package com.example.libs.model;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;

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
}
