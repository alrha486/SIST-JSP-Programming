<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<jsp:useBean id="sc" class="com.example.libs.controller.SelectController" />
<%@page import="java.io.BufferedInputStream" %>
<%@page import="java.io.BufferedOutputStream" %>
<%@page import="java.io.FileInputStream" %>
<%@page import = "java.io.File" %>

<%
		int idx = Integer.parseInt(request.getParameter("idx"));
		String filename = sc.getFilename(idx); // 실제로 유저가 다운로드받을 파일이름(DB에서 가져온)
		
		String filename1 = request.getParameter("filename"); // 전 페이지에서 가져온 파일이름
		String saveDirectory = application.getRealPath(".") + "/files";
		File file = new File(saveDirectory,filename);
		
		if(file.exists()){
			response.setHeader("Content-Disposition", "attachment;filename=" + filename1 + ";");
			BufferedInputStream bis = null;
			bis = new BufferedInputStream(new FileInputStream(file));
			BufferedOutputStream bos = null;
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buffer = new byte[512];
			int count = 0;
			while((count = bis.read(buffer)) > 0){
				bos.write(buffer,0,count);
			}
			bos.close();
			bis.close();
		}else{		
%>
<script>
	alert("파일이 존재하지않습니다.");
	history.back();
</script>
<%
		}
%>