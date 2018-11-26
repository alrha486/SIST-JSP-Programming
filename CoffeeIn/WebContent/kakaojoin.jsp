<%@ page language="java" contentType="text/html; charset=UTF-8"
    			pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8" />
<c:set var="userid" value="${sessionScope.userid}" />
<c:set var="username" value="${sessionScope.username}" />
<!-- 카카오로그인 버튼누르면 사용자의 ID값과 이름을 가져옴 -->

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>카카오 회원가입 창</title>
	<style type="text/css">
		ul > li { list-style-type: none; padding: 5px 0px }
	</style>
	<script src="js/jquery.min.js"></script>
	<script>
		$(function(){
			$("#btnClose").click(function(){
				<%
				session.removeAttribute("username");
				%>
				location.href ="index.jsp";
			});
		});
		
		
		window.addEventListener('load', setup); // 윈도우가 로딩되면 setup 함수 실행
		
		function setup(){ 
			document.getElementById("btnNickCheck").addEventListener('click', myclick1); //닉네임중복체크
		}		
		
		function sendit() {  // 회원가입폼의 submit 버튼 누르면 호출되는 함수
			var nickResult = document.getElementById("nickresult").value; // 닉네임 중복체크 했는지 여부
			var regExp = /^\d{3}\d{3,4}\d{4}$/; // 전화번호 정규식
 			var tel = document.getElementById("tel");
			
 			if(nickResult != "nickCheck"){ // 중복체 크 안하면 그대로 none 
 				alert("닉네임중복체크를 해주세요."); 
 				return false;
 			}else if(!regExp.test(tel.value)){ // 전화번호 정규식 위반
 					alert('전화번호를 제대로 입력해주세요');
 					tel.value = "";
 					return false;
 			}	

 			document.forms["myform"].submit(); // if문을 다 통과했으면 submit 실행
			} 
 			
 			function myclick1(){ // 닉네임 중복체크 버튼 누르면
				var usernickname = document.getElementById("usernickname").value;
				var pattern1 = /^[\w가-힣]{2,20}$/; //닉네임정규식
				
				if(usernickname == ""){
					alert("닉네임을 입력해주세요");
					return false;
				}else if(!pattern1.test(usernickname)){
 					alert('닉네임은 특수문자 및 공백을 사용하실 수 없습니다.');
 					usernickname = "";
 					return false;
 				}else{
				window.open("nickCheck.jsp?usernickname=" + usernickname,"닉네임 체크", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
				}
			}	
		
		
		
		
	</script>
	
</head>
<body>
	<h1>카카오 회원가입</h1>  <!-- 카카오 회원가입은 이름,폰번,이메일만 받아서 DB에 저장  -->
		<form action="/CoffeeIn/apiRegister.jsp" method="post" id="myform" name="myform" 
					onsubmit="sendit(); return false;" action="/CoffeeIn/apiRegister.jsp">
		<ul>
			<li><input type="hidden" name="userid" value="${userid}" /></li>
			<li>Name : <input type="text" name="username" id="username" readonly="readonly" value=${username} /></li>
			<li>닉네임 : <input type="text" name="usernickname" id="usernickname" placeholder="Enter your Nickname" required/>
			<input type="button" value="닉네임중복체크" id="btnNickCheck"></li>
			<li>Email : <input type="email" name="email" id="email" placeholder="Enter your email address" required="required" size="40"></li>
			<li>Tel : <input type="text" name="tel" id="tel" placeholder="Enter your ID" required="required"></li>
			<li><input type="hidden" id="nickresult" name="nickresult" value="none" /></li>
			<li><input type="submit" value="가입하기">&nbsp;&nbsp;
					<input type="reset" value="다시하기">&nbsp;&nbsp;
					<input type="button" value="홈으로" id="btnClose"></li>
		</ul>
	</form>	
</body>
</html>