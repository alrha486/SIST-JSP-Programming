<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	private String getCookieValues(Cookie [] array, String key){
		String value = null;
		if(array == null) return null;
		for(int i=0; i<array.length; i++){
			if(array[i].getName().equals(key)) value = array[i].getValue();
		}
		return value;
}
%>
<% 
	Cookie [] array = request.getCookies();
%>
    
<h1>Cookie Read</h1>
<ul>
	<li>사용자 이름 : <%=getCookieValues(array, "USERNAME") %></li>
	<li>사용자 성별 : <%=getCookieValues(array, "USERGENDER") %></li>
	<li>사용자 나이 : <%=getCookieValues(array, "USERAGE") %></li>
</ul>

 <button onclick="javascript:history.back();">돌아가기</button>