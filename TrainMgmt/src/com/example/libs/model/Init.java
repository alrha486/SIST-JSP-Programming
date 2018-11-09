package com.example.libs.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Init extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try{
			CustomerDAO.initDB();
			out.println("alert('잘 처리됐슴'); ");
			request.getServletContext().getRequestDispatcher("/servlet/List").forward(request, response);
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	} 
}
