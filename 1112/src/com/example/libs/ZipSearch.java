package com.example.libs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.example.libs.model.DBClose;
import com.example.libs.model.DBConnection;

public class ZipSearch extends SimpleTagSupport{
	private String keyword;
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public void doTag() throws JspException, IOException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JspContext ctx = this.getJspContext();
		JspWriter out = ctx.getOut();
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT zipcode, sido, gugun, dong, bunji FROM zipcode " +
		                  "WHERE dong LIKE '%" + this.keyword + "%' ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			out.println("<table border='1'>");
			out.println("<thead><tr><th>우편번호</th><th>시도</th>");
			out.println("<th>시/군/구</th><th>읍/면/동</th><th>번지</th></tr></thead>");
			out.println("<tbody>");
			if(!rs.next()) {
				out.println("<tr>");
				out.println("<td colspan='5'>찾고자 하시는 읍/면/동이 없습니다.</td></tr>");
			}else {
				do {
					out.println("<tr>");
					out.print("<td>" + rs.getString("zipcode") + "</td>");
					out.print("<td>" + rs.getString("sido") + "</td>");
					out.print("<td>" + rs.getString("gugun") + "</td>");
					out.print("<td>" + rs.getString("dong") + "</td>");
					out.print("<td>" + rs.getString("bunji") + "</td>");
					out.println("</tr>");
				}while(rs.next());
			}
			if(rs != null) rs.close();   if(pstmt != null) pstmt.close();
		}catch(SQLException ex) {
			System.out.println(ex);
		}finally {
			DBClose.close(conn);
		}
	}
}



