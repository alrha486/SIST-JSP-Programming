package com.example.libs;

import java.io.IOException;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloWorld extends TagSupport {
	@Override
	public int doStartTag() throws JspException{
		JspWriter out  = pageContext.getOut();
		Date now = new Date();
		try {
			out.println("<div style='color:blue;font-weight:900;font-size:2em'>");
			out.println(now.toString() + "</div>");
		} catch (IOException e) {
			System.out.println(e);
		}
		return this.SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException{
		return EVAL_PAGE;
	}
}
