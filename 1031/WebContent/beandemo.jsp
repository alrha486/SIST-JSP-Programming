<jsp:directive.page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" />

<jsp:useBean id="student" class="com.example.model.Student" />
<%-- <jsp:setProperty name="student" property="*"/> --%>
<jsp:setProperty name="student" property="username" param="username" />
<jsp:setProperty name="student" property="age" param="age" /> 


<h1>Member Info</h1>

<ul>
	<li>Name : <jsp:getProperty name="student" property="username" /></li>
	<li>Age : <jsp:getProperty name="student" property="age" /></li>	
</ul>