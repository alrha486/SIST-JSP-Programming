<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.example.libs.controller.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<!--sc.select()의 결과는 게시판 정보가 담겨있는 GesipanVO형 벡터임 -->
<c:set var="GESIPAN" value="${sc.select(param.idx)}" />
<c:set var="grp" value="${param.grp}" />
<c:set var="lev" value="${param.lev}" />
<c:set var="step" value="${param.step}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 답변하기</title>
</head>
<body>
<h1>게시판 글 답변하기</h1>
	<form action="/Gesipan1/reply_ok.jsp" method="post" >
		<!-- 폼 작성 후 write_ok.jsp로 이동  -->
		<ul style="list-style-type:none;margin:10px 0px">
			<li><input type="hidden" name="p_idx" value="${param.idx}"/></li>
			<li><input type="hidden" name="p_grp" value="${grp}"/></li>
			<li><input type="hidden" name="p_lev" value="${lev}"/></li>
			<li><input type="hidden" name="p_step" value="${step}"/></li>
			
			<li>Name : <input type="text" name="name"  value="${sessionScope.name}"/></li>
			<li>Password : <input type="password" name="passwd" /></li>
			<li>Email : <input type="email" name="email" size="50"/></li>							
			<li>Title : <input type="text" name="title" size="70" 
								value="${Util.reconvert(GESIPAN.getTitle(),false)}"/></li>
			<li>Contents : <textarea type="text" name="contents" rows="5" cols="50">
								${Util.concat(Util.reconvert(GESIPAN.getContents(),true))}</textarea></li>
			<li><button type="submit">답변하기</button>&nbsp;&nbsp;&nbsp;
				<button type="reset">다시하기</button></li>
		</ul>
	</form>
</body>
</html>