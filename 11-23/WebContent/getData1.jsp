<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.json.simple.JSONObject, org.json.simple.parser.JSONParser" %>
<%@ page import="java.io.BufferedReader" %>
<fmt:requestEncoding value="utf-8" />
 <%
    BufferedReader br = request.getReader();
    String line = null , str ="";
    while((line = br.readLine()) != null){
       str += line + "\n";
    }
    
    JSONParser parser = new JSONParser();
    JSONObject obj = (JSONObject)parser.parse(str);
    String username = (String)obj.get("username");
    int userage = Integer.parseInt((String)obj.get("userage"));
    String userphone = (String)obj.get("userphone");
 %>
    

<span style="color:green;font-weight:bold"><%=username %></span>
<span style="color:red;font-style:italic"><%=userage %></span>
<span style="color:blue;text-decoration:underline"><%=userphone %></span>







<!-- JSON  다루기 -->
    