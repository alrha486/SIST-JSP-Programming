<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>로그인 페이지</title>
	<script src="js/jquery.min.js"></script>
	<script>
		$(function(){
			$("#naver").click(function(){
				var clientId = "6XdcN0HDkORTF33yi1jD";//애플리케이션 클라이언트 아이디값";
			    var redirectURI = "<%=getURI()%>";
			    var state = "<%=getState()%>";
			    var apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    location.href = apiURL;
			});
		});
	</script>
</head>
<body>
	<input type="image" src="images/naver.jpg" id="naver">
</body>
</html>
<%!
	private String getURI() throws Exception{
		return URLEncoder.encode("http://www.example.com/MemberShip/navercallback.jsp", "UTF-8");
	}
%>
<%! 
	private String getState(){
		SecureRandom random = new SecureRandom();
    	String state = new BigInteger(130, random).toString();
    	return state;
	}
%>