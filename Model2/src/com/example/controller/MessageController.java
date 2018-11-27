package com.example.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class MessageController extends HttpServlet {
	private Properties info;
	private Map<String, Object> map;
	@Override
	public void init(ServletConfig config) throws ServletException{
		ServletContext ctx = config.getServletContext();
		String filename = config.getInitParameter("propertyConfig");
		File file = new File(filename);
		info = new Properties();
		try {
			info.load(new FileInputStream(file));
		}catch(IOException ex) {}
		Iterator<Object> list = info.keySet().iterator();
		this.map = new HashMap<String, Object>();
		while(list.hasNext()) {
			String command = (String)list.next();
			String className = info.getProperty(command);
			try {
				Class classObj = Class.forName(className);
				Object obj = classObj.newInstance();
				map.put(command, obj);   //View, com.example.controller.MessageProcess@7dcec65d
			}catch(ClassNotFoundException ex) {
				System.out.println("ClassNotFoundException");
			} catch (InstantiationException e) {
				System.out.println("InstantiationException");
			} catch (IllegalAccessException e) {
				System.out.println("IllegalAccessException");
			}
		}
	}
	
	private void myservice(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{  //2. 단계 --> 요청 분석
		String viewName = null;
		Controller controller = null;
		try {
			String command = request.getParameter("command");  //View
			Object obj = this.map.get(command);
			controller = (Controller)obj;
			viewName = controller.myservice(request, response);
		}catch(Exception ex) {
			System.out.println(ex);
		}
		//5. 단계 --> view 정의
		System.out.println("viewName = " + viewName);
		RequestDispatcher rd = request.getRequestDispatcher(viewName);
		rd.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.myservice(request, response); //1. 단계 --> 요청 수신
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.myservice(request, response); //1. 단계
	}
	
}
