<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<ul>
	<li>회원 이름 : ${ param.username }</li>
	<li>회원 나이 : ${ param.userage }</li>
	<li>회원 성별 : ${ param.usergender }</li>
	<li>회원 취미 : ${ paramValues.hobby[0] } ${ paramValues.hobby[1] } ${ paramValues.hobby[2] }
						${ paramValues.hobby[3] } ${ paramValues.hobby[4] }</li>
</ul>