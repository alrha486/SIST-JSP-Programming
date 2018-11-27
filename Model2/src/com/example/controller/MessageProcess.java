package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageProcess implements Controller {

	@Override
	public String myservice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/messageView.jsp";
	}
}
