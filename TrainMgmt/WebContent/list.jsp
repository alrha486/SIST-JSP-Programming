<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.example.libs.model.TrainDTO"%>
<%@ page import="java.util.Vector"%>
<jsp:useBean id="select"
	class="com.example.libs.controller.SelectController" />
<%
   int count1 = 0;
   int live1 = 0;
  /*  int count2 = 0;
   int live2 = 0;
   int count3 = 0;
   int live3 = 0;
   int count4 = 0;
   int live5 = 0; */
   Vector<TrainDTO> vector1 = select.selectSeoul();
   /* Vector<TrainDTO> vector2 = select.selectBusanl();
   Vector<TrainDTO> vector3 = select.selectDaegu();
   Vector<TrainDTO> vector4 = select.selectGwangzu(); */
   
   if(vector1 == null){ // 서울
	   count1 = 0; 
	   live1 = 0;			   
   }else{ count1 = vector1.size(); live1 = 1;}
   
  /*  if(vector2 == null){
	   count1 = 0; 
	   live1 = 0;			   
   }else{ count1 = vector2.size(); live = 2;}
   
   if(vector3 == null){
	   count2 = 0; 
	   live2 = 0;			   
   }else{ count2 = vector3.size(); live = 3;}
   
   if(vector4 == null){
	   count3 = 0; 
	   live3 = 0;			   
   }else{ count3 = vector4.size(); live = 4;} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>금일 지역별 예약 현황</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<h1>금일 지역별 예약 현황</h1>

	<%if(live1 == 1){
	%>
	<table border='1'>
		<!-- 서울 -->
		<thead>
			<tr>
				<th>번호</th>
				<th>지역</th>
				<th>성별</th>
				<th>열차명</th>
				<th>좌석</th>
				<th>할증종류</th>
				<th>할인액</th>
				<th>차비</th>
			</tr>
		</thead>
		<tbody>
			<%
			for(int i=0; i<count1; i++){ 
			TrainDTO tr = vector1.elementAt(i);
			%>
			<tr>
				<td><%=tr.getArea() %></td>
				<td><%=tr.getSex() %></td>
				<td><%=tr.getTname() %></td>
				<td><%=tr.getSeat() %></td>
				<td><%=tr.getHal_kind() %></td>
				<td><%=tr.getDiscount() %></td>
				<td><%=tr.getFee() %></td>
			</tr>
		</tbody>
	</table>
	<%
	
	}
	 %>
	<%}%>

	<%-- <%if(live1 == 1){
	   for(int i=0; i<count1; i++){
           TrainDTO tr1 = vector2.elementAt(i);
	   %>
	<table border='1'>
		<!-- 부산 -->
		<thead>
			<tr>
				<th>번호</th>
				<th>지역</th>
				<th>성별</th>
				<th>열차명</th>
				<th>좌석</th>
				<th>할증종류</th>
				<th>할인액</th>
				<th>차비</th>
			</tr>
		</thead>
		<tbody>
			<%  for(int i=0; i<count1; i++){ %>
			<tr>
				<td><%=tr1.getNum() %></td>
				<td><%=tr1.getArea() %></td>
				<td><%=tr1.getSex() %></td>
				<td><%=tr1.getTname() %></td>
				<td><%=tr1.getSeat() %></td>
				<td><%=tr1.getHal_kind() %></td>
				<td><%=tr1.getDiscount() %></td>
				<td><%=tr1.getFee() %></td>
			</tr>
		</tbody>
	</table>
	<%
		int sum1 = sum1 + tr.getFee();
				
			
			} %>
	<%
			out.println("부산지역 차비의 합 = " + sum); 	
	%>


	<%if(live2 == 1){ // 대구 
					for(int i=0; i<count2; i++){
				}
           TrainDTO tr2 = vector3.elementAt(i);
	   %>
	<table border='1'>
		<!-- 대구 -->
		<thead>
			<tr>
				<th>번호</th>
				<th>지역</th>
				<th>성별</th>
				<th>열차명</th>
				<th>좌석</th>
				<th>할증종류</th>
				<th>할인액</th>
				<th>차비</th>
			</tr>
		</thead>
		<tbody>
			<%  for(int i=0; i<count2; i++){ %>
			<tr>
				<td><%=tr2.getNum() %></td>
				<td><%=tr2.getArea() %></td>
				<td><%=tr2.getSex() %></td>
				<td><%=tr2.getTname() %></td>
				<td><%=tr2.getSeat() %></td>
				<td><%=tr2.getHal_kind() %></td>
				<td><%=tr2.getDiscount() %></td>
				<td><%=tr2.getFee() %></td>
			</tr>
		</tbody>
	</table>
	<%
		int sum2 = sum2 + tr2.getFee();
				
			
			} %>
	<%
			out.println("대구지역 차비의 합 = " + sum2); 	
	%>


	<%if(live3 == 1){ // 광주
	   for(int i=0; i<count3; i++){
           TrainDTO tr3 = vector4.elementAt(i);
	   %>
	<table border='1'>
		<!-- 서울 -->
		<thead>
			<tr>
				<th>번호</th>
				<th>지역</th>
				<th>성별</th>
				<th>열차명</th>
				<th>좌석</th>
				<th>할증종류</th>
				<th>할인액</th>
				<th>차비</th>
			</tr>
		</thead>
		<tbody>
			<%  for(int i=0; i<count3; i++){ %>
			<tr>
				<td><%=tr3.getNum() %></td>
				<td><%=tr3.getArea() %></td>
				<td><%=tr3.getSex() %></td>
				<td><%=tr3.getTname() %></td>
				<td><%=tr3.getSeat() %></td>
				<td><%=tr3.getHal_kind() %></td>
				<td><%=tr3.getDiscount() %></td>
				<td><%=tr3.getFee() %></td>
			</tr>
		</tbody>
	</table>
	<%
		int sum3 = sum3 + tr3.getFee();			
			} %>
			
			
	<%
			out.println("광주지역 차비의 합 = " + sum3); 	
			 int total = sum + sum1 + sum2 + sum3; %> --%>
	<h3>
		<%-- 총 합계 = <%=total %></h3> --%>
</body>
</html>