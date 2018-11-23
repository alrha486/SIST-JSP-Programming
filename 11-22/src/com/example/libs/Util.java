package com.example.libs;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Util {
	/**
	 * @author Instructor
	 * @param ResultSet 
	 * @return JSONArray
	 * @version 1.1
	 * @when 2018.11.22
	 */
	public static JSONArray convertResultSetToJSON(ResultSet rs) throws Exception{
		JSONArray array = new JSONArray();
		ResultSetMetaData rsmd = rs.getMetaData();
		while(rs.next()) {
			int column_count = rsmd.getColumnCount();
			JSONObject obj = new JSONObject();
			for(int i = 1 ; i <= column_count ; i++) {
				obj.put(rsmd.getColumnLabel(i).toLowerCase(), rs.getObject(i));
			}
			array.add(obj);
		}
		return array;
	}
	/**
	 * @author Instructor
	 * @param ResultSet 
	 * @return String(XML)
	 * @version 1.1
	 * @when 2018.11.22
	 */
	//public static String convertResultSetToXML(ResultSet rs) {}
}
