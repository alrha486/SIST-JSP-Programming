	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Map,java.util.Set,java.util.Iterator,java.util.Collection" %>
    <ul>
<%
		Map<String,String[]> map = request.getParameterMap();
	//Enumeration<String> enums = request.getParameterNames();
	//while(enums.hasMoreElements()){
		Set<String> set = map.keySet();
		Iterator <String> iters = set.iterator();
		while(iters.hasNext()){
		String name = iters.next();
		String [] array = map.get(name);
		for(int i=0; i<array.length;i++){
%>
<li>
	 <%=name %> : <%=array[i] %> 
 </li> <% } //for끝 %>
 <% } %>
</ul>