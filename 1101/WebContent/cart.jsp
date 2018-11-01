<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Mall</title>
</head>
<body>
	<jsp:include page="menu.html" /> 
	<% 
	request.setCharacterEncoding("utf-8"); // 페이지 인코딩 
	
	String item = request.getParameter("item");
	String type = request.getParameter("type"); // value는 add
	
	Vector<String> cart = null; // cart 라는 벡터 생성 
	
	if(item != null){ // select에서 받아온 value 값이 있으면 
		cart = (Vector <String>)session.getAttribute("mycart");  // mycart라는 키값에 일치하는 value값 을 cart에 추가 
		
		if(cart == null){ // 세션이 처음 만들어졌다면, 즉 처음 페이지 실행하면
			cart = new Vector<String>(1,1); // cart라는 벡터 생성 
			cart.addElement(item); // 벡터에 item 추가 
			session.setAttribute("mycart", cart); // mycart라는 키 값에 cart(item value값을 추가)
		}else{
			if(type.equals("add")) cart.addElement(item); // 추가하기 누를 때 같이 전송되는 input (hidden) cart에 item값 추가 
			else if(type.equals("remove")) cart.removeElement(item); // 반대로 cart에서 삭제
		}
	}
	%>
	<% if(cart != null){ //카트가 있으면 %>
	<h2>현재 Cart에 <%=cart.size() %>개의 CD가 담겨있습니다.</h2>
	<ol><!-- //벡터의 사이즈개만큼 출력 -->
		<% for(int i=0; i<cart.size(); i++){	%>
		<li><%=cart.elementAt(i) %></li>
		<!-- cart에 있는 value값들 다 추가 -->
		<% } %>
	</ol>
	<%} %>
	<% if(cart != null && cart.size() > 0){ %>
	<hr />
	<jsp:include page="remove.jsp" />
	<% } %>
</body>
</html>







