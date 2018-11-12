package com.example.libs;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SelectTag extends SimpleTagSupport{
	private Map<String, String> map = 
			new HashMap<String, String>();
	@Override
	public void doTag() throws JspException, IOException{
		map.put("Apple", "사과");  map.put("Mango",  "망고");
		map.put("Lemon", "레몬");  map.put("Melon",  "멜론");
		map.put("Peach", "복숭아");  map.put("Banana",  "바나나");
		JspContext ctx = this.getJspContext();
		JspWriter out = ctx.getOut();
		out.println("<select>");
		Set<String> keys = this.map.keySet();
		Iterator<String> iters = keys.iterator();
		for(int i = 0 ; i < keys.size() ; i++) {
			String key = iters.next();
			ctx.setAttribute("value", key);
			ctx.setAttribute("text", this.map.get(key));
			this.getJspBody().invoke(null);
		}
		out.println("</select>");
	}
}





