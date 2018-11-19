<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
 <!-- Select Controller 생성자 sc 생성 -->
<c:set var="vector" value="${sc.selectAll()}" />
<!-- 게시판 글 전체 가져오는 vector -->
<c:set var="count" value="${vector.size()}" />
<!-- 벡터의 사이즈(게시판 글 개수) -->

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>EXAMPLE.COM 고객 상담 페이지</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<h1>EXAMPLE.COM의 고객 상담 Q&A</h1>
	<table border='0'>
		<tr>
			<td><a href="write.jsp">입력하기</a></td>
			<td>[${count}]</td> <!-- 게시판 글 개수(count) -->
		</tr>
	</table>
	<table border='1'>
		<thead>
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 50%">제목</th>
				<th style="width: 15%">작성날짜</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${vector eq null}" > <!-- 게시판이 비어있다면 -->
				<tr><td colspan="9" style="text-align:center">데이터가 없습니다.</td></tr>
			</c:if>
			
			<c:if test="${count ne 0}" > <!-- 게시판에 글이 하나라도 있다면 -->
				<c:forEach var="row" items="${vector}" ><!-- 게시판 개수 만큼 루프돌기 변수 row-->
					<tr>
						<td>${row.getIdx()}</td> 
						<td><a href="mailto:${row.getEmail()}">${row.getName()}</td>
						<td style="text-align:left"><a href="view.jsp?idx=${row.getIdx()}">${row.getTitle()}</a></td>
						<!-- view.jsp로 이동 GET 방식으로 idx값을 전송 -->
						<td>${row.getWritedate()}</td>
						<td>${row.getReadnum()}</td>
						<!-- 루프 돌면서 벡터에 담겨있는 게시판 정보 출력 -->
						
					</tr>		
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>