<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.libs.model.EmployeeDTO" %>
<jsp:useBean id="insert" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="calc" class="com.example.libs.controller.CalcController" /> 

<%
	String sabun = request.getParameter("sabun");
	int hobong = Integer.parseInt(request.getParameter("hobong"));
	int night_hour = Integer.parseInt(request.getParameter("night_hour"));
	int family = Integer.parseInt(request.getParameter("family"));
	
	EmployeeDTO emp = new EmployeeDTO(sabun, hobong, night_hour, family);
	calc.calc(emp);
	int row = insert.insert(emp);
	if(row == 1){
%>
	<script>
		alert("Data Insert Success");
		location.href = "index.html";
	</script>
<% }else{ %>
	<script>
		alert("Data Insert Failure");
		history.back();
	</script>
<% } %>




