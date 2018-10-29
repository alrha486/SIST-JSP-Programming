<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<thead>
		<tr style="background-color:green;color : white">
			<% for(int i=1; i<10; i++){ %>
			<th>
				<%=i%>단
			</th>
			<% } %>
		</tr>
		</thead>
		
		<tbody>
		<% for(int k=1;k<10; k++) {%>
			<tr>
				<%for(int j=1; j<10; j++){ %>
				<td><%=k%>x<%=j%>=<%=k*j %></td>
				<% } %>
			</tr>
			<% } %>
		</tbody>
	</table>
</body>
</html>