package com.example.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext ctx = sce.getServletContext();
		
		Map<String, String> mymap = new HashMap<String, String>();
		mymap.put("1번선수", "이승엽");
		mymap.put("2번선수", "김연아");
		mymap.put("3번선수", "한지민");
		mymap.put("코치", "이동국");
		mymap.put("감독", "이창동");
		ctx.setAttribute("mymap", mymap);
	}

}





