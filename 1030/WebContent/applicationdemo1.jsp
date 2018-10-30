<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.RandomAccessFile" %>

<%
	String path = application.getRealPath("./count.txt");
	RandomAccessFile raf = new RandomAccessFile(path, "rw");
	String strCount = raf.readLine().trim();  //1000
	int count = Integer.parseInt(strCount);
	count++;
%>
<div>방문자 수 : <%=count %></div>
<%
	raf.seek((long)0);
	raf.writeUTF(String.valueOf(count));
	raf.close();
%>