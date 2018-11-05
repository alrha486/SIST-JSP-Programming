package com.example.libs.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.libs.controller.SelectController;
import com.example.libs.model.EmployeeDTO;

public class IndexServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		res.setContentType("text/xml");
		PrintWriter out = res.getWriter();
		//SelectController sc = new SelectController();
		//Vector<EmployeeDTO> vector = sc.select();
		out.println("<result>");
		out.println("<code>success</code>");
		out.println("<data>");
		out.println("{'count' : 5,'message' : 'Hello, World}");
		out.println("</data>");
		out.println("</result>");
		out.close();
	}
}




