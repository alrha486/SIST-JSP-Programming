package com.example.libs.controller;

import java.sql.SQLException;

import com.example.libs.model.GesipanDAO;
import com.example.libs.model.GesipanVO;

public class UpdateController {
	
	// 댓글 달 떄 step 1증가
	public void updateStep(int grp, int step) {
		try {
			GesipanDAO.updateStep(grp, step);
		} catch (SQLException e) {
				System.out.println(e);
		}
	}
	
	// 조회 수 증가
	public void readnumUpdate(int idx) {
		try {
			GesipanDAO.readnumUpdate(idx);
		} catch (SQLException e) {
			System.out.println(e);
		}	
	}
	
	// 게시판 글 수정(업데이트)
	public int update(GesipanVO gesipan) {
		int row = 0;		
		try {
			row = GesipanDAO.update(gesipan);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return row;
	}	
	
}
