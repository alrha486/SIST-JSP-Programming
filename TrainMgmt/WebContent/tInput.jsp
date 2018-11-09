<!-- 
18.11.09 hInput.jsp
김은서
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.example.libs.model.TrainDTO" %>
<jsp:useBean id="insert" class="com.example.libs.controller.InsertController" />
<jsp:useBean id="calc" class ="com.example.libs.controller.CalcController" /> 


<!-- tInput.html에서 입력받은 정보를 insert하는 부분이다. -->
<%
   String tscode = request.getParameter("tscode");
   String place = request.getParameter("place");
   String zumin1 = request.getParameter("zumin1");
   String zumin2 = request.getParameter("zumin2");
   String hal = request.getParameter("hal");

   TrainDTO train = new TrainDTO(tscode, place, zumin1, zumin2, hal);
   calc.calc(train); // 계산 후 세팅 완료
   
   // 데이터 입력 성공하면 출력 화면으로, 실패하면 입력 화면으로 리턴 -->
   
   int row = insert.insert(train); // 입력 성공하면 1 반환
   if(row==1) {
%>
<script>
   alert("Insert Success!");
   location.href = "list.jsp";
</script>
<% } else { %>
<script>
   alert("Insert Fail!");
   history.back();
</script>
<% } %>