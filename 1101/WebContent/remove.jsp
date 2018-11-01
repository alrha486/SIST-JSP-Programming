<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Vector" %>
<%@ page import="java.util.Vector" %>
<h1>삭제할 CD를 선택해주세요</h1>
<form method="post">
	<select name="item">
		<option>--선택--</option>
		<%
			Vector <String> cart = (Vector <String>)session.getAttribute("mycart");
		for(int i=0; i<cart.size(); i++){
			String item = cart.elementAt(i);
			out.println("<option value='"+ item + "'>" + item + "</option>");
			
		}
		%>
	</select><br />
	<input type="hidden" name="type" value="remove" />
	<input type="submit" value="삭제하기" />
</form>