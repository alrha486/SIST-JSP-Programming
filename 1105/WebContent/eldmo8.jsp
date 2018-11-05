<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.util.ArrayList" %>
<%
	ArrayList<String> fruits = new ArrayList<String>();
	fruits.add("바나나");
	fruits.add("딸기");
	fruits.add("포도");
	fruits.add("복숭아");
	request.setAttribute("FRUITS", fruits);
%>

<ul>
	<li>${FRUITS[0]}</li>
	<li>${FRUITS[1]}</li>
	<li>${FRUITS[2]}</li>
	<li>${FRUITS[3]}</li>
</ul>
