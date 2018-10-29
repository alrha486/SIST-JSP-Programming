<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	private int calcSum(int kor, int eng, int mat){
		return kor + eng + mat;
}
	private double calcAvg(int sum){
		return sum/3;
	}
	private char calcGrade(double avg){
		return avg <= 100 && avg >=90 ? 'A' :
					avg <= 90 && avg >=80 ? 'B' :
						avg <= 80 && avg >=70 ? 'C' :
							avg <= 70 && avg >=60 ? 'D' : 'F';
				
	}
%>
<%
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	int sum = calcSum(kor,eng,mat);
	double avg = calcAvg(sum);
	char grade = calcGrade(avg);
%>

<ul>
<li>총점 = <%=sum %></li>
<li>평균 = <%=avg %></li>
<li>평점 = <%=grade %></li>
</ul>

<form>
	kor : <input type="number" name="kor"></br> 
	eng : <input type="number" name="eng"></br>
	mat : <input type="number" name="mat"></br>
	<input type="submit" value="게산하기" />
</form>