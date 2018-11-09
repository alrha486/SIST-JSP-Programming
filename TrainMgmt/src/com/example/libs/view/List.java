package com.example.libs.view;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.model.DBConnection;

public class List extends HttpServlet implements Servlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Connection conn = DBConnection.getConnection();
		try{
			int total = 0;  //전체차비
			out.println("<html><body>");
			out.println("<center>");
			out.println("<h1>[<a href='/TrainMgmt/servlet/Init'>DB초기화</a>]금일 지역별 예약 현황[<a href='/TrainMgmt/input.html'>입력하기</a>]</h1>");
			out.println("<hr size='3' width='90%' color='red'>");			
			String sql = "SELECT distinct region FROM Customer ORDER BY region";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){  //레코드가 있다면
				do{
					int sum = 0;
					String region = rs.getString(1);
					out.println("&lt;지역 = <font size='4' color='green'>" + region + "&gt;</font><br />");
					out.println("<table border='1' width='100%' cellpadding='0' cellspacing='0'>");
					out.println("<tr bgcolor='#0000cc' height=\"30\">");
					out.println("<th width=\"5%\"><font size=\"2\" color=\"#ffffff\">번호</font></th>");
					out.println("<th width=\"10%\"><font size=\"2\" color=\"#ffffff\">지역</font></th>");
					out.println("<th width=\"5%\"><font size=\"2\" color=\"#ffffff\">성별</font></th>");
					out.println("<th width=\"20%\"><font size=\"2\" color=\"#ffffff\">열차명</font></th>");
					out.println("<th width=\"20%\"><font size=\"2\" color=\"#ffffff\">좌석</font></th>");
					out.println("<th width=\"10%\"><font size=\"2\" color=\"#ffffff\">할증종류</font></th>");
					out.println("<th width=\"15%\"><font size=\"2\" color=\"#ffffff\">할인액</font></th>");
					out.println("<th width=\"15%\"><font size=\"2\" color=\"#ffffff\">차비</font></th>");
					out.println("</tr>");
					String sql1 = "SELECT * FROM Customer WHERE region = ? ORDER BY gender";
					PreparedStatement pstmt = conn.prepareStatement(sql1);
					pstmt.setString(1, region);
					ResultSet rs1 = pstmt.executeQuery();
					while(rs1.next()){
						out.println("<tr>");
						out.println("<td align='center'>" + rs1.getInt("id") + "</td>");
						out.println("<td align='center'>" + rs1.getString("region") + "</td>");
						out.println("<td align='center'>" + rs1.getString("gender") + "</td>");
						out.println("<td align='center'>" + rs1.getString("tname") + "</td>");
						out.println("<td align='center'>" + rs1.getString("sname") + "</td>");
						out.println("<td align='center'>" + rs1.getString("kind") + "</td>");
						out.println("<td align='center'>" + rs1.getInt("price") + "</td>");
						int charge = rs1.getInt("charge");
						sum += charge;
						out.println("<td align='center'>" + charge + "</td>");
						out.println("</tr>");
					}
					out.println("</table>");
					out.println("<table border='0' width='100%' cellpadding='0' cellspacing='0'>");
					out.println("<tr><td>" + region + " 지역 차비의 합 = <font color='red'>" + sum + "</font></td></tr></table><p />");
					rs1.close();  pstmt.close();
					total += sum;
				}while(rs.next());
				out.println("<font size='7' color='red'>총 차비 = <b>" + total + "</b></font>");
				out.println("</center>");
				out.println("</body></html>");
				stmt.close();
			}else{   //레코드가 없다면
				out.println("<h1>데이터가 없습니다.</h1>");
			}
		}catch(SQLException ex){
			out.println("<font color='red' size='2'>Table 이 없습니다. 초기화 해주세요.</font>");
		}
		out.close();
	}
}
