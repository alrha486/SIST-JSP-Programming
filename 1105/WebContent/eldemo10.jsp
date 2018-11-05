<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="com.example.libs.ProductBean" id="pb" />
<jsp:setProperty name="pb" property="name" value="쌍용컴퓨터" />
<jsp:setProperty name="pb" property="price" value="2000000" />
<%
	session.setAttribute("PRODUCT", pb);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JAVA Bean 호출하기</title>
</head>
<body>
	<ul>
		<li>상품의 이름 : ${sessionScope.PRODUCT.name }</li> <!-- 객체.property -->
		<li>상품의 가격 : ${sessionScope.PRODUCT.price }</li>
	</ul>
</body>
</html>