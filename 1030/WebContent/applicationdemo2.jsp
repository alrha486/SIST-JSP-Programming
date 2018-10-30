<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URL" %>
<%@ page import="java.io.InputStream, java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader, java.io.FileReader" %>
<%
	//URL url = application.getResource("./sungjuk.dat");
	//InputStream is = url.openStream();
	InputStream is = application.getResourceAsStream("./sungjuk.dat");
	BufferedReader br = new BufferedReader(new InputStreamReader(is));
	String line = null;
	while((line = br.readLine()) != null){
		System.out.println(line);	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>쌍용고등학교 성적표</h1>
	
</body>
</html>







