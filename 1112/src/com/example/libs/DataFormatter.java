package com.example.libs;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class DataFormatter extends SimpleTagSupport{
	private String header;
	private String items;
	public void setHeader(String header) {
		this.header = header;
	}
	public void setItems(String items) {
		this.items = items;
	}
	@Override
	public void doTag() throws JspException, IOException{
		JspWriter out = this.getJspContext().getOut();
		out.println("<table border='1'>");
		out.println("<thead><tr>");
		out.println("<th>" + this.header + "</th></tr></thead>");
		out.println("<tbody>");
		StringTokenizer st = new StringTokenizer(this.items, ",");
		while(st.hasMoreTokens()) {
			String token = st.nextToken();
			out.println("<tr><td>" + token + "</td></tr>");
		}
		out.println("</tbody></table>");
	}
}





