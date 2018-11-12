package com.example.libs;

import java.io.IOException;
import java.util.Date;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class HelloWorld extends SimpleTagSupport {
	private JspContext ctx;
	@Override
	public void doTag() throws JspException, IOException{
		System.out.println("Called doTag()");
		JspWriter out = this.ctx.getOut();
		Date now = new Date();
		try {
			out.print("<div style='color:blue;font-weight:900;font-size:2em'>");
			out.println(now.toString() + "</div>");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void setParent(JspTag parent) {
		System.out.println("Called setParent()");
	}
	@Override
	public JspTag getParent() {
		System.out.println("Called getParent()");
		return null;
	}
	@Override
	public void setJspContext(JspContext pc) {
		System.out.println("Called setJspContext()");
		this.ctx = pc;
	}
	@Override
	public void setJspBody(JspFragment jspBody) {
		System.out.println("Called setJspBody()");
	}
}
/*
	만일 body가 있는 태그가 호출됐다면
	setJspBody() 도 호출되고, 
	심플태그가 다른 tag에 포함되지 않는다면 setParent()를 호출하지 않는다.
*/