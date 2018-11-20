<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<jsp:useBean id="ic" class="com.example.libs.controller.InsertController" />
<!-- InsertControll 생성자 ic  -->
<jsp:useBean id="gesipan" class="com.example.libs.model.GesipanVO" />
<!-- GesipanVO 형 생성자 gesipan -->
<fmt:requestEncoding value="utf-8"/>
<!--  넘어온 정보의 인코딩  -->

<%
	String saveDirectory = application.getRealPath(".") + "/files";	
	//진짜 물리적인 경로 지정(파일이 저장 될 실제경로)
	int maxPostSize = 1024 * 1024 * 10;
	// 10MB (최대파일 업로드 사이즈)
	MultipartRequest mr = new MultipartRequest(request, saveDirectory,maxPostSize, "utf-8"
			 														,new DefaultFileRenamePolicy());
	// request객체 대신 사용할 MultipartRequest 객체
	
	
	gesipan.setName(mr.getParameter("name"));
	gesipan.setPasswd(mr.getParameter("passwd"));
	gesipan.setEmail(mr.getParameter("email"));
	


	String title = mr.getParameter("title");
	// 폼에서 넘어온 title 세팅
	title = title.replace("<", "&lt;");
	title = title.replace(">", "&gt;");
	title = title.replace("'", "''"); //'하나를 ''두개로
	
	gesipan.setTitle(title); // GesipanVO형 에 setTitle();
	
	String contents = mr.getParameter("contents");
	// 폼에서 넘어온 contents 값 세팅
	contents = contents.replace("<", "&lt;");
	contents = contents.replace(">", "&gt;");
	contents = contents.replace("'", "''");
	contents = contents.replace("\r\n", "<br />"); //\r\n : enter
	gesipan.setContents(contents); // GesipanVO형에 setContents

	String filename = mr.getFilesystemName("filename");
	//getFilesystemName() >> 파일시스템에 파일 저장할 떄 이름이 곂칠수도있으니 이름에 초단위까지도 저장해줌

	if(filename == null) filename = "";
	gesipan.setFilename(filename);	
%>

<c:set var="row" value="${ic.insert(gesipan)}" />
<!-- insertController의 insert()호출 -->
<!-- insert 성공시 1  -->

<c:if test="${row eq 1}" > <!-- 입력 성공시  -->
	<script>
		alert("insert Success");
		location.href = "index.html"; // 메인페이지로
	</script>
</c:if>

<c:if test="${row ne 1}" > <!-- 입력 실패시 -->
	<script>
		alert("insert Failure");
		history.back(); // 이전페이지로 
	</script>
</c:if>





