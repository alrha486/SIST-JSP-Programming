<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%! 
	private void getUserInfo(javax.servlet.jsp.PageContext pc) throws IOException{
		JspWriter out = pc.getOut();
		ServletRequest req = pc.getRequest(); 
		out.println(req.getRemoteAddr());
	}
%>

<% getUserInfo(pageContext);  %>