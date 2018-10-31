<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String username = request.getParameter("username");
	int age = Integer.parseInt(request.getParameter("userage"));
	if(age < 10){
%>
	<jsp:forward page="kids.jsp">
		<jsp:param name="username" value="<%=username%>" />
	</jsp:forward>
<%
	}else if(age >=10 && age <20){ 
%>
		<jsp:forward page="teen.jsp">
		<jsp:param name="username" value="<%=username%>" />
	</jsp:forward>
<%
	}else if(age >=20 && age <65){ 
%>
		<jsp:forward page="adult.jsp">
		<jsp:param name="username" value="<%=username%>" />
	</jsp:forward>
<%
	}else{ 
%>
		<jsp:forward page="silver.jsp">
		<jsp:param name="username" value="<%=username%>" />
	</jsp:forward>
<% 
	}
%>