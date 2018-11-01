<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<h1>session Read</h1>
<ul>
	<li>사용자 이름 : <%=(String)session.getAttribute("username") %></li>
	<li>사용자 성별 : <%=(String)session.getAttribute("usergender") %></li>
	<li>사용자 나이 : <%=(Integer)session.getAttribute("userage") %></li>
</ul>

 <button onclick="javascript:history.back();">돌아가기</button>