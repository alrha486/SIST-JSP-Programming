<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import ="java.util.Enumeration" %>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="member" class="com.example.libs.model.MemberVO" />
<jsp:useBean id="sc" class="com.example.libs.controller.selectController" />

<c:set var="userid" value="${param.userid}" />
<c:set var="username" value="${param.username}" /> <!-- 카카오 , 네이버-->
<c:set var="k_member" value="${sc.selectMember(userid)}" /> <!-- 카카오 -->
<c:set var="kakao" value="${k_member.userid}" />

<%
	Enumeration param = request.getParameterNames();
	String strParam = ""; 
	while(param.hasMoreElements()) { 
	    String name = (String)param.nextElement(); 
	    String value = request.getParameter(name); 
	    strParam += name + "=" + value + "&"; 
	}
	String URL = request.getRequestURL() + "?" + strParam; 
	
	int idx = URL.indexOf("?");
	String URL2 = URL.substring(idx+1); // ? 이후
			
	int idx2 = URL2.indexOf("&");
	String URL3 = URL2.substring(0,idx2); // userid =...
	String URL4 = URL2.substring(idx2+1); //username = ...
	
	int idx3 = URL3.indexOf("=");
	String userid = URL3.substring(idx3+1);	
	String username = URL4.substring(10,13);

	session.setAttribute("userid", userid);
	session.setAttribute("username", username);
%>

<!-- 카카오톡 아이디가 DB에 없다면 -->
<c:if test="${empty kakao}" > 
	<script>
	location.href="kakaojoin.jsp";
	</script>
</c:if>

<!-- 카카오톡 아이디가 DB에 있다면 -->
<c:if test="${not(empty kakao)}" >
	<%
	//session.setAttribute("username", username); // 로그인 성공시 세션 세팅
	%>
	<script>
	location.href="index.jsp";
	</script>
</c:if>


