package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class SelectController {
	
	public String getFilename(int idx) {
		String filename = null;		
		try {
			filename = GesipanDAO.getFilename(idx);
		} catch (SQLException e) {
				System.out.println(e);
		}
		
		return filename;
	}
	
	
	public int getPageCount(int pageSize) {
		int pageCount = 0;
		try {
			pageCount = GesipanDAO.getPageCount(pageSize);
		} catch (SQLException e) {
				System.out.println(e);
		}
		
		return pageCount;
	}
	
	
	public String selectPasswd(int idx) {
		String dbpasswd = null;
		try {
		dbpasswd = GesipanDAO.selectPassword(idx);
		}catch(SQLException e) {
			System.out.println(e);
		}
		return dbpasswd;
	}
	
	public GesipanVO select(int idx) {
		GesipanVO gesipan = null;
		try {
			gesipan = GesipanDAO.select(idx);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return gesipan; //이걸 리턴하면 그 부분에 해당하는 하나를 넘기겠지
	}
	
	
	public Vector<GesipanVO> selectAll(int cuurentPage,int pageSize){
		Vector<GesipanVO> vector = null;
		try {
			vector = GesipanDAO.selectAll(cuurentPage,pageSize);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return vector;
	}
}
