<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="2kb" autoFlush="false"%>
<%
	int count = 1;
	for(int i=1; i<1000; i++){
		out.print(i + "&nbsp;");
		count ++;
		if(count % 10 == 0){
			out.print("<br>");
		}
	}
%>