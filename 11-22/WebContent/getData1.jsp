<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONObject, org.json.simple.parser.JSONParser" %>
<%@ page import="java.io.BufferedReader" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />
<%
	BufferedReader reader = request.getReader();
	String line = null, str = "";
	while((line = reader.readLine()) != null){
		str += line + "\n";
	}
	
	JSONParser parser = new JSONParser();
	JSONObject obj = (JSONObject)parser.parse(str);
	String username = (String)obj.get("username");
	int userage = Integer.parseInt((String)obj.get("userage"));
	String userphone = (String)obj.get("userphone");
%>

<span style='color:blue;font-weight:bold;font-size:2em'><%=username %></span>
<span style='font-style:italic'><%=userage %></span>
<span style='text-decoration:underline'><%=userphone %></span>




