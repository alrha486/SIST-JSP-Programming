package com.example;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig    //반드시
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Part part = request.getPart("file");    //binary로 받고
		String filename = request.getParameter("fileName");   //글자로 받고
		String saveDirectory = this.getServletContext().getRealPath(".") + "/files";
		File file = new File(saveDirectory, filename);
		PrintWriter out = response.getWriter();
		byte [] buffer = new byte[1024];
		FileOutputStream fos = new FileOutputStream(file);
		InputStream is = part.getInputStream();
		int count = 0;
		while((count = is.read(buffer)) > 0){
			fos.write(buffer, 0, count);
		}
		is.close();
		fos.close();
		out.write("<span style='color:green;font-size:1.5em'>File Upload Success</span>");
		out.close();
	}

}
