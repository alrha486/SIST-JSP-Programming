<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<!-- InsertControll 생성자 ic  -->
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<!-- GesipanVO 형 생성자 gesipan -->
<fmt:requestEncoding value="utf-8"/>
<!--  넘어온 정보의 인코딩  -->

<jsp:setProperty property="name" name="gesipan" value="${param.name}" />
<jsp:setProperty property="passwd" name="gesipan" value="${param.passwd}" />
<jsp:setProperty property="email" name="gesipan" value="${param.email}" />
<!-- GesipanVO형 gesipan에 넘어온 name,passwd,email 을 세팅-->

<%
	String title = request.getParameter("title");
	// 폼에서 넘어온 title 세팅
	title = title.replace("<", "&lt;");
	title = title.replace(">", "&gt;");
	title = title.replace("'", "''"); //'하나를 ''두개로
	
	gesipan.setTitle(title); // GesipanVO형 에 setTitle();
	
	String contents = request.getParameter("contents");
	// 폼에서 넘어온 contents 값 세팅
	contents = contents.replace("<", "&lt;");
	contents = contents.replace(">", "&gt;");
	contents = contents.replace("'", "''");
	contents = contents.replace("\r\n", "<br />"); //\r\n : enter
	gesipan.setContents(contents); // GesipanVO형에 setContents

%>

<c:if test="${empty param.filename}">  <!-- filename 값이 비어있다면 -->
	<jsp:setProperty property="filename" name="gesipan" value="" />
</c:if>

<c:if test="${not(empty param.filename)}"> <!-- filename 값이 비어있지 않다면 -->
	<jsp:setProperty property="filename" name="gesipan" value="${param.filename}" />
</c:if>

<c:set var="row" value="${ic.insert(gesipan)}" />
<!-- insertController의 insert()호출 -->
<!-- insert 성공시 1  -->

<c:if test="${row eq 1}" > <!-- 입력 성공시  -->
	<script>
		alert("insert Success");
		location.href = "index.html"; // 메인페이지로
	</script>
</c:if>

<c:if test="${row ne 1}" > <!-- 입력 실패시 -->
	<script>
		alert("insert Failure");
		history.back(); // 이전페이지로 
	</script>
</c:if>





