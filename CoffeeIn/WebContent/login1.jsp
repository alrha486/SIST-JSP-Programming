<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="css/bootstrap.css" />
<style type="text/css">
.jumbotron {
	background-image: url("images/digital.jpg");
}

body {
	color: white;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(function(){
	$("#btnJoin").bind('click',function(){ //회원가입 버튼 누르면
		location.href = "register.html";
	});
	
	$("#btnIdSearch").bind('click',function(){ //ID찾기 버튼 누르면
		location.href = "idsearch.jsp";
	});
	
	$("#naver").click(function(){ // 네이버 회원가입 API 
		var clientId = "6XdcN0HDkORTF33yi1jD";//애플리케이션 클라이언트 아이디값";
	    var redirectURI = "<%=getURI()%>";
	    var state = "<%=getState()%>";
	    var apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    location.href = apiURL; // 버튼누르면 navercallback.jsp로 이동 
	});
	
	
});
</script>
</head>
<body>

	<div class="container">
		<div class="jumbotron">
			<h1 class="display-3">안녕하세요!</h1>
			<p class="lead">2조프젝</p>
			<hr class="my-4">
			<p>2조프젝</p>
			<p class="lead">
				<a class="btn btn-warning btn-lg" href="#" role="button">더 알아보기</a>
			</p>
		</div>
	</div>
	<form class="form-horizontal" method="POST"
		action="/CoffeeIn/login.jsp">
		<div class="form-group">
			<label for="userid" class="col-sm-3 control-label">User ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="userid" name="userid"
					placeholder="Enter your ID">
			</div>
		</div>

		<div class="form-group">
			<label for="password" class="col-sm-3 control-label">USER Password</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Enter your Password">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-6">
				<button type="submit" class="btn btn-success">Sign in</button>
				<button type="button" class="btn btn-danger" id="btnJoin">Join</button>
				<button type="button" class="btn btn-warning" id="btnIdSearch">ID 찾기</button>
				<button type="button" class="btn btn-success" id="btnPwSearch">PW 찾기</button>
			</div>
		</div>
	</form>
				<div class="col-sm-offset-3 col-sm-6">
				<a id="kakao-login-btn"></a><br> <!-- 카카오톡 회원가입 버튼 -->
				<input type="image" src="images/naver.jpg" id="naver" width="100px" height="100px"><br> <!-- 네이버 회원가입 버튼 -->
			</div>
</body>

<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('415bc6029e5f00cc41281a3fef06583b');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) { // 로그인에 성공했으면 
        	  //alert(JSON.stringify(res)); //회원정보 출력
     		  //window.location="kakaojoin.jsp?userid="+userid +"&username=" + username;
            var userid = JSON.stringify(res.id);
            var username = JSON.stringify(res.properties['nickname']); 
       
            sessionStorage.setItem('userid',userid);
            sessionStorage.setItem('username',username);
			
        	window.location="check_k.jsp?userid="+userid+"&username="+username; 
        	  //location.href="kakaojoin.jsp";
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
</html>

<%!
	private String getURI() throws Exception{
		return URLEncoder.encode("http://localhost:8080/CoffeeIn/navercallback.jsp", "UTF-8");
	}
%>
<%! 
	private String getState(){
		SecureRandom random = new SecureRandom();
    	String state = new BigInteger(130, random).toString();
    	return state;
	}
%>