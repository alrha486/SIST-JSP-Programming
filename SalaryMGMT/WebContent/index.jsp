<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Vector" %>
<%@ page import="com.example.libs.model.EmployeeDTO" %>
<jsp:useBean id="select" class="com.example.libs.controller.SelectController" />
<%
	int count = 0;
	Vector<EmployeeDTO> vector = select.select();
	if(vector == null) count = 0;
	else count = vector.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 봉급 정보 출력창</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<h1>사원 봉급 정보 리스트</h1>
	<table border='0'>
		<tr>
			<td><a href="input.html">입력하기</a></td>
			<td>[<%=count %>명 데이터]</td>
		</tr>
	</table>
	<table border='1'>
		<thead>
			<tr>
				<th>사번</th><th>부서</th><th>기본급</th><th>직무급</th>
				<th>야근수당</th><th>가족수당</th><th>총지급액</th><th>소득세</th><th>실수령액</th>
			</tr>
		</thead>
		<tbody>
			<% if(count == 0){ %>
			<tr><td colspan="9" style="text-align:center">데이터가 없습니다.</td></tr>
			<% 
				}else { 
					for(int i = 0 ; i < count ; i++){	
						EmployeeDTO emp = vector.elementAt(i);
			%>
				<tr>
					<td><%=emp.getSabun() %></td><td><%=emp.getDname() %></td>
					<td><%=String.format("%,d", emp.getGibon()) %></td>
					<td><%=String.format("%,d", emp.getJsudang()) %></td>
					<td><%=String.format("%,d", emp.getNsudang()) %></td>
					<td><%=String.format("%,d", emp.getFsudang()) %></td>
					<td><%=String.format("%,d", emp.getTotal()) %></td>
					<td><%=String.format("%,d", emp.getTax()) %></td>
					<td><%=String.format("%,d", emp.getSalary()) %></td>
				</tr>		
			<%  } //for end
				}//if end	%>
		</tbody>
	</table>
</body>
</html>




