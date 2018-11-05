package com.example.libs;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateEL {
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public static String getFormat(Date date) {
		return sdf.format(date);		
	}
}
