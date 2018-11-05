<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Vector" %>
<%@ page import="com.example.libs.model.EmployeeDTO" %>
<jsp:useBean id="select" class="com.example.libs.controller.SelectController" />
<%
	Vector<EmployeeDTO> vector = select.select(); // 전체 조회한 결과값을 가지고 있는 벡터 
%>    
<result>
	<code>success</code>
	<data>
		{
			"count" : <%=vector.size()%>,  
			"message" : [
<%
			String str = ""; // json 형식("key" : "value")으로 저장
			for(int i = 0 ; i < vector.size() ; i++){
				EmployeeDTO emp = vector.elementAt(i);
				str +="{";
				str += "\"sabun\" : \"" + emp.getSabun() + "\", \"dname\" : \"" + emp.getDname() + "\", "; 
				str += "\"gibon\": " + emp.getGibon() + ", \"jsudang\": " + emp.getJsudang() + ", ";
				str += "\"nsudang\" : " + emp.getNsudang() + ", \"fsudang\": " + emp.getFsudang() + ", ";
				str += "\"total\" : " + emp.getTotal() + ", \"tax\" : " + emp.getTax() + ", ";
				str += "\"salary\" : " + emp.getSalary();
				str += "},";
			}
			str = str.substring(0, str.length() - 1); // 마지막까지 다 저장하고 , 빼주기 
%>
		<%=str%>
			]
		}
	</data>
</result>