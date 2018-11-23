<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.example.libs.Util" %>
<%@ page import="org.json.simple.JSONArray" %>
<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://192.168.56.4:3306/world", "root", "javamariadb");
	String sql = "SELECT ID, Name, CountryCode, District, Population FROM city " +
			          "WHERE CountryCode = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("code"));
	ResultSet rs = pstmt.executeQuery();
	JSONArray array = Util.convertResultSetToJSON(rs);
%>
{
	"results" : <%=array%>
}






