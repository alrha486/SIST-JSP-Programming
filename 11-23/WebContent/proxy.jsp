<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.httpclient.HttpClient" %>
<%@ page import="org.apache.commons.httpclient.HttpStatus" %>
<%@ page import="org.apache.commons.httpclient.methods.GetMethod" %>
<%
	String url = "http://rss.etnews.com/Section901.xml";  //전자신문의 오늘의 뉴스
	HttpClient client = new HttpClient();
	GetMethod getMethod = new GetMethod(url);
	int statusCode = 0;
	try{
		statusCode = client.executeMethod(getMethod);
		out.clearBuffer();
		response.reset();
		if(statusCode == 200){
			response.setStatus(HttpStatus.SC_OK);   //200
			String result = getMethod.getResponseBodyAsString();
			response.setContentType("text/xml;charset=utf-8");
			out.println(new String(result.getBytes("ISO8859_1"), "utf-8"));
		}
	}catch(Exception ex){
		System.out.println(ex);
	}finally{
		if(statusCode == 200)	getMethod.releaseConnection();
	}
%>