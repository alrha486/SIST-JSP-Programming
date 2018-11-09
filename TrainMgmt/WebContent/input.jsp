<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.example.libs.model.CustomerVO" %>
<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<%
	CustomerVO customer = 
		new CustomerVO(request.getParameter("tscode"),
				request.getParameter("pcode"), 
				request.getParameter("jumin1"), 
				request.getParameter("jumin2"),
				request.getParameter("ppcode"));
	int row = ic.insert(customer);
	if(row > 0) {
%>
	<body bgcolor='green'>
		<script>
			alert('Insert Success!!!');
			location.href='index.jsp';
		</script>
	</body>
<% }else{  %>
	<body bgcolor='red'>
		<script>
			alert('Insert Failure!!!');
			history.go(-1);
		</script>
	</body>
<% 	}   %>