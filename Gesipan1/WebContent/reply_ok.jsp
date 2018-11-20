<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="uc" class="com.example.libs.controller.UpdateController" />

<c:set var="idx" value="${param.p_idx}" />
<c:set var="step" value="${param.p_step}" />
<jsp:setProperty name="gesipan" property="name" value="${param.name}" />
<jsp:setProperty name="gesipan" property="passwd" value="${param.passwd}" />
<jsp:setProperty name="gesipan" property="email" value="${param.email}" />
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

<jsp:setProperty name="gesipan" property="grp" value="${param.p_grp}" />
<jsp:setProperty name="gesipan" property="lev" value="${param.p_lev+1}" />
${uc.updateStep(param.p_grp, param.p_step); ''}
<jsp:setProperty name="gesipan" property="step" value="${param.p_step+1}" />

<c:set var="row" value="${ic.insertReply(gesipan)}" />

<!-- 답글 달기 성공 시  -->
<c:if test="${row eq 1 }" > 
	<script>
		location.href="index.html";
	</script>
</c:if>

<c:if test="${row ne 1 }" >
	<script>
		alert("insert fail");
		history.back();
	</script>
</c:if>