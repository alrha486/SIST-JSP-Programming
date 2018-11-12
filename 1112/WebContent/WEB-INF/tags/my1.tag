<%@ tag language="java" pageEncoding="UTF-8" body-content="scriptless"%>
<%@ tag import="java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Calendar now = Calendar.getInstance();
	String greeting = 
			now.get(Calendar.HOUR_OF_DAY) < 12 ? "Good Morning" : 
				now.get(Calendar.HOUR_OF_DAY) < 18 ? "Good Afternoon" : 
					"Good Evening";
	request.setAttribute("greeting", greeting);
%>
<c:set var="greeting" value="${greeting}" />
<span style='color:green;font-size:1.5em'>${greeting}</span>
	<jsp:doBody />
<span style='color:blue;font-weight:900'>님! 반갑습니다.</span>