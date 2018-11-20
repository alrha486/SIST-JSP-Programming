<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<jsp:useBean id="Util" class="com.example.libs.controller.Util" />

<%
   //1. pageSize : 한 페이지에 그리는 레코드의 갯수
   //2. pageCount : 전체 레코드에 대한 pageSize의 분할 갯수
   //3. currentPage : 현재 페이지
   int pageSize = 5;
   String pageStr = request.getParameter("page");
   if(pageStr == null) pageStr = "1";
   int currentPage = Integer.parseInt(pageStr);
   int pageCount = sc.getPageCount(pageSize);
   pageContext.setAttribute("currentPage",currentPage);
   pageContext.setAttribute("pageSize",pageSize);
   pageContext.setAttribute("pageCount",pageCount);
%>

 <!-- Select Controller 생성자 sc 생성 -->
<c:set var="vector" value="${sc.selectAll(pageScope.currentPage,pageScope.pageSize)}" />
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
			<td>[<%=currentPage %>/ <%=pageCount %>]</td> <!-- 게시판 글 개수(count) -->
		</tr>
	</table>
	<table border='1'>
		<thead>
			<tr>
				<th style="width: 8%">번호</th>
				<th style="width: 10%">작성자</th>
				<th style="width: 50%">제목</th>
				<th style="width: 10%">File</th>
				<th style="width: 14%">작성날짜</th>
				<th style="width: 8%">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${vector eq null}" > <!-- 게시판이 비어있다면 -->
				<tr><td colspan="9" style="text-align:center">데이터가 없습니다.</td></tr>
			</c:if>
			
			<c:if test="${count ne 0}" > <!-- 게시판에 글이 하나라도 있다면 -->
				<c:forEach var="row" items="${vector}" ><!-- 게시판 개수 만큼 루프돌기 변수 row-->
					<tr>
					
					
						<td>
						<c:if test="${row.getLev() > 0 }">
							&nbsp;
						</c:if>
						<c:if test="${row.getLev() eq 0 }">
							${row.getGrp()}
						</c:if>
						</td> 
						
						
						<td><a href="mailto:${row.getEmail()}">${row.getName()}</td>
						<td style="text-align:left">
							<c:forEach begin="0" end="${row.getLev() * 3}" step="1">
								&nbsp;
							</c:forEach>
							<c:if test="${row.getLev() > 0}" >
								<img src="images/images.png"/>
							</c:if>
							<a href="view.jsp?idx=${row.getIdx()}">${row.getTitle()}</a>
							
						</td>
						<!-- view.jsp로 이동 GET 방식으로 idx값을 전송 -->
						
						<td>
							<c:if test="${row.getFilename() eq null }">
								&nbsp;
							</c:if>
							<c:if test="${row.getFilename() ne null }">							
								<img src="images/${Util.getExtension(row.getFilename())}.PNG"  width="30px" height="30px" alt="dd"/>
							</c:if>
							
						</td>
						<td>${row.getWritedate()}</td>
						<td>${row.getReadnum()}</td>
						<!-- 루프 돌면서 벡터에 담겨있는 게시판 정보 출력 -->
						
					</tr>		
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<br />
	<div style="text-align:center">
	
	<c:if test="${currentPage eq 1}">
		&lt;&lt;&nbsp;&nbsp;&nbsp;
	</c:if>	
	<c:if test="${currentPage ne 1}">
		<a href="list.jsp?page=${currentPage -1}">&lt;&lt;</a>&nbsp;&nbsp;&nbsp;
	</c:if>
	
      <c:forEach begin="1" end="${pageCount}" var="i">
         <c:if test="${i eq currentPage}">
            <span style="color:red;font-size:1.5em;">${i}</span>&nbsp;&nbsp;
         </c:if>
         <c:if test="${i ne currentPage }">
            <a href="list.jsp?page=${i}">${i}</a>&nbsp;&nbsp;
         </c:if>
      </c:forEach>
   	<c:if test="${currentPage eq pageCount}">
		&gt;&gt;&nbsp;&nbsp;&nbsp;
	</c:if>	
	<c:if test="${currentPage ne pageCount}">
		<a href="list.jsp?page=${currentPage+1}">&gt;&gt;</a>&nbsp;&nbsp;&nbsp;
	</c:if>
   </div>
</body>
</html>