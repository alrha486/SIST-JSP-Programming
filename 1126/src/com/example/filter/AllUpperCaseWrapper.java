package com.example.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class AllUpperCaseWrapper extends HttpServletRequestWrapper{
	private HttpServletRequest request;  
	public AllUpperCaseWrapper(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	@Override
	public String getParameter(String name) {
		String parameter = request.getParameter(name);
		if(parameter == null) return null;
		else {
			System.out.println(parameter.toUpperCase());
			return parameter.toUpperCase();
		}
	}
	@Override
	public String[] getParameterValues(String name) {
		String [] parameters = request.getParameterValues(name);
		if(parameters == null) return null;
		else { 
			for(int i = 0 ; i < parameters.length ; i++)
				parameters[i] = parameters[i].toUpperCase();
			return parameters;
		}
	}
}
