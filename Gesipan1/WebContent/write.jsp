<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성하기</title>
</head>
<body>
<h1>게시판 글 작성하기</h1>
	<form action="/Gesipan1/write_ok.jsp" method="post" >
		<!-- 폼 작성 후 write_ok.jsp로 이동  -->
		<ul style="list-style-type:none;margin:10px 0px">
			<li>Name : <input type="text" name="name" value="${sessionScope.name}" /></li>
				<!-- 사용자의 이름으로 session 세팅  -->
			<li>Password : <input type="password" name="passwd" /></li>
			<li>Email : <input type="email" name="email" size="50" /></li>
			<li>Title : <input type="text" name="title" size="70" /></li>
			<li>Contents : <textarea type="text" name="contents" rows="5" cols="50"></textarea></li>
			<li><button type="submit">작성하기</button>&nbsp;&nbsp;&nbsp;
				<button type="reset">다시하기</button></li>
		</ul>
	</form>
</body>
</html>