package com.example.libs.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.example.libs.model.CustomerVO;
import com.example.libs.model.DBConnection;

class Calc {
	private CustomerVO customer;
	Calc(CustomerVO customer){		
		this.customer =customer;
	}
	void calc() throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT pname, kuri FROM place WHERE code = ?";
		PreparedStatement pstmt = conn.prepareCall(sql);
		pstmt.setString(1, customer.getPcode());
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String pname = rs.getString("pname");    //장소명
		customer.setRegion(pname);
		int kuri = rs.getInt("kuri");                     //거리
		rs.close();   pstmt.close();
		String gender = (customer.getJumin2().trim().charAt(0) == '1') ? "남자" : "여자";   //성별
		customer.setGender(gender);
		sql = "SELECT tname FROM train WHERE code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customer.getTscode().trim().substring(0,2));
		ResultSet rs1 = pstmt.executeQuery();
		rs1.next();   
		String tname = rs1.getString("tname");   //기차명
		customer.setTname(tname);
		rs1.close();   pstmt.close();
		sql = "SELECT sname FROM seat WHERE code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customer.getTscode().trim().substring(2));
		ResultSet rs2 = pstmt.executeQuery();
		rs2.next();
		String sname = rs2.getString("sname");      //좌석명
		customer.setSname(sname);
		rs2.close();   pstmt.close();
		
		sql = "SELECT kind,rate FROM premium WHERE code = ?";
		System.out.println(customer.getPpcode());
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customer.getPpcode());
		ResultSet rs3 = pstmt.executeQuery();
		System.out.println(rs3.next());
		String kind = rs3.getString("kind");   //할증종류
		customer.setKind(kind);
		double rate = rs3.getDouble("rate");   //할인율
		rs3.close();   pstmt.close();
		sql = "SELECT danga FROM price WHERE tname = ? and sname = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, tname);
		pstmt.setString(2, sname);
		ResultSet rs4 = pstmt.executeQuery();
		rs4.next();
		int danga = rs4.getInt("danga");   
		int price = kuri * danga;               
		int premium = (int)(price * rate);   
		customer.setPrice(premium);
		int charge = price - premium;    
		customer.setCharge(charge);
		rs4.close();   pstmt.close();
	}
}
