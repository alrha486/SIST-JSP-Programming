<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error/error.jsp" %>
<%@ page import="com.example.libs.model.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%
	String countrycode = request.getParameter("countrycode"); // 밑에 form에서 자기자신한테 전송한 country코드 값

	ResultSet rs = null, rs1 =null; // 전역변수로 초기화
	Statement stmt = null;  PreparedStatement pstmt = null; // 전역변수로 초기화
	
	Connection conn = DBConnection.getConnection();  // conn 리턴 받아오기 
	
	
	if(countrycode == null){ // 맨처음 실행했을 때는 countrycode가 null
		stmt = conn.createStatement(); // 커넥션 풀 열어주고 
		String sql = "SELECT DISTINCT CountryCode FROM city ORDER BY CountryCode ASC"; // 전체 국가코드 다 추출 
		rs = stmt.executeQuery(sql); // rs에 저장 
	}else{   // 자기 자신한테 전송을 했으면 
		String sql = "SELECT * FROM city WHERE CountryCode = ?"; // 그걸로 검색해서
		pstmt = conn.prepareStatement(sql); // 커넥션 풀 열기
		pstmt.setString(1, countrycode); // 값 입력 
		rs1 = pstmt.executeQuery(); // rs1에 저장 
	}
	
%>

<form method="post"> <!-- action 속성이 없으면 자기 자신한테 전송  -->
	Country Code : 
	<select name="countrycode">
		<option>--선택--</option>
		<% if(rs != null){ %>
		<%
			while(rs.next()){
				String code = rs.getString(1);
				out.println("<option value='" + code +"'>" + code + "</option>");
			}
		%>
		<% }  %>
	</select>
	<br />
	<input type="submit" value="검색" /> 
</form>
<hr />
<% if(countrycode != null){ %> <!-- 전역변수 countrycode의 값이 있다면  -->
<table border="1">
	<thead>
		<tr>
			<th>ID></th><th>Name</th><th>CountryCode</th>
			<th>District</th><th>Population</th>
		</tr>
	</thead>
	<tbody>
		<% while(rs1.next()){ %> <!-- rs1 이 없을 떄까지 -->
		<tr>
			<td><%=rs1.getInt("ID") %></td>
			<td><%=rs1.getString("Name") %></td>
			<td><%=rs1.getString("CountryCode") %></td>
			<td><%=rs1.getString("District") %></td>
			<td><%=rs1.getInt("Population") %></td>
		</tr>
		<% } %>
	</tbody>
</table>
<% } %>
<%
	if(rs != null) rs.close();    if(rs1 != null) rs1.close(); 
	if(stmt != null) stmt.close();  if(pstmt != null) pstmt.close();  // 전역변수이기 떄문에 if문을 사용하여 close()
	conn.close();
%>