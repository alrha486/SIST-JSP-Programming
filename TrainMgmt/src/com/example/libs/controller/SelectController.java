package com.example.libs.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.example.libs.model.CustomerDAO;

public class SelectController {
	public static int getDanga(String tname, String sname) {
		int danga = 0;
		try {
			danga = CustomerDAO.getDanga(tname, sname);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return danga;
	}
	public static Map<String, Object> getKindRate(String code){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = CustomerDAO.getKindRate(code);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return map;
	}
	public static String getSname(String code) {
		String sname = null;
		try {
			sname = CustomerDAO.getSname(code);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return sname;
	}
	public static String getTname(String code) {
		String tname = null;
		try {
			tname = CustomerDAO.getTname(code);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return tname;
	}
	public static Map<String, Object> getPnameKuri(String code){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map = CustomerDAO.getPnameKuri(code);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return map;
	}
}
