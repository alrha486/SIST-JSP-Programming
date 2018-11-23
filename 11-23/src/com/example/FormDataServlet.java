package com.example;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig  //반드시
@WebServlet("/FormDataServlet")
public class FormDataServlet extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      
      PrintWriter out = response.getWriter();
      String username = request.getParameter("username");
      int userage = Integer.parseInt(request.getParameter("userage"));
      String userphone = request.getParameter("userphone");
      
      out.print("<span style='color:green;font-weight:bold;font-size:1.5em'>");
      out.println(username + "</span>");
      out.println("<span style='font-style:italic'>" + userage + "</span>");
      out.println("<span style='text-decoration:underline'>" + userphone + "</span>");
      out.close();
   }
}