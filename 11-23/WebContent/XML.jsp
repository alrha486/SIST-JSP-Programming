<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jdom2.Document" %>
<%@ page import="org.jdom2.Element" %>
<%@ page import="org.jdom2.input.*" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLConnection" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.JSONObject, org.json.simple.parser.JSONParser" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		td { border : 1px solid black}
	</style>
<title>Insert title here</title>
</head>
<body>
	<%
    String responseBuilder = null;
    try {
     // Create a URLConnection object for a URL
     URL url = 
     new URL( "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20120101" );
     URLConnection conn = url.openConnection();
     HttpURLConnection httpConn;

     httpConn = (HttpURLConnection)conn;
     BufferedReader rd = new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
     String line;

     while ((line = rd.readLine()) != null)
     {
      responseBuilder += line + '\n';
       
     }
     //out.println(responseBuilder.toString());
     JSONParser parser = new JSONParser();
     JSONObject obj = (JSONObject)parser.parse(responseBuilder);
     String username = (String)obj.get("username");
     int userage = Integer.parseInt((String)obj.get("movieNm"));
     String userphone = (String)obj.get("openDt");
      
    }
    catch(Exception e){
     out.println(e);
    }
		
	%>


	<table style="border-collapse:collapse;border:1px solid black;width:600px;margin-left:auto;margin-right:auto">
		<thead>
			<tr style="background-color:navy;color:white">
				<th>랭크</th><th>movieNm</th><th>openDt</th>
			</tr>
		</thead>
		<tbody id="result"></tbody>
	</table>
</body>
</html>