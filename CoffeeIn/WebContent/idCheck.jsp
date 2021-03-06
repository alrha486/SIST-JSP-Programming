<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@192.168.56.4:1521:orcl" user="scott" password="tiger" var="conn" />
        <sql:query dataSource="${conn}" var="rs">  
		SELECT userid FROM Member 
		WHERE userid = ?		  
		<sql:param value="${param.userid}"/>
		</sql:query>
		
<html>
<head>
    <title>아이디 중복 체크</title>
    
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
   </style>    
   
    <script type="text/javascript">
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("userId").value = opener.document.getElementById("userid").value;
        }
        // 아이디 중복체크
        function idCheck(){      	
        	var id = document.getElementById("userId").value; // 현재폼의 userid text   	

            if (!id) { // text가 비어있다면 경고창
                alert("아이디를 입력하지 않았습니다.");
                return false;
           }    	
	
			var dbSuccess = ${rs.getRowCount()}; // DB조회 결과 (0:ID존재x, 1:ID존재)
			if(dbSuccess == 1){ // ID가 DB에 이미 존재한다면         
            alert("이미존재하는 ID입니다!!!");
			opener.document.getElementById("userid").value = "";
			self.close();
			//document.getElementById("userId").value = "";
        	}
  			
			if(dbSuccess == 0){ // ID가 DB에 이미 존재하지않는다면         
	            alert("사용가능한 ID입니다!!!");
	           document.getElementById("useBtn").style.visibility = "visible";
	        } 

        }
        
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.getElementById("idresult").value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.getElementById("userid").value = document.getElementById("userId").value;
            
            if (opener != null) {
            //    opener.chkForm = null;
                self.close();
            }    
        }    
        
        

   </script>
    
</head>
<body onload="pValue()">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
            <input type="text" name="idinput" id="userId">
            <input type="button" value="중복확인" onclick="idCheck()">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
    </div>
</div>    
</body>
</html>

	
