package com.example.libs;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MyDate extends TagSupport{
	private String type;

	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public int doStartTag() throws JspException{
		JspWriter out  = pageContext.getOut();
		Date now = new Date();
		Locale locale = null;
		DateFormat df = null;
	
		
		try {
			switch(this.type) {
			case "us" : locale = Locale.US;	break;
			case "jp" : 	locale = Locale.JAPAN;	break;
			case "cn" : locale = Locale.CHINA;	break;
			case "uk" : locale = Locale.UK;	break;
			case "fr"  : locale = Locale.FRANCE;	break;
			case "ge" :	locale = Locale.GERMAN;	 break;
			default : locale = Locale.KOREA;	break;
			}
			df = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.FULL,locale);
			
			out.println("<div style='color:red'>");
			out.println(df.format(now) + "</div>");
			
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
