package com.example.libs.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Vector;

public class GesipanDAO {
	
	public static void updateStep(int grp, int step)throws SQLException{
		 Connection conn = DBConnection.getConnection();
	      String sql = "{ call board_update_step(?,?) }";
	      CallableStatement cstmt = conn.prepareCall(sql);
	      cstmt.setInt(1, grp);
	      cstmt.setInt(2, step);
	      cstmt.executeUpdate();
	      
	      if(cstmt != null) cstmt.close();
	      DBClose.close(conn);
	}
	
	// 게시판 수정(업데이트) 
	public static int update(GesipanVO gesipan) throws SQLException{
		 Connection conn = DBConnection.getConnection();
	      String sql = "{ call board_update(?,?,?,?) }";
	      CallableStatement cstmt = conn.prepareCall(sql);
	      cstmt.setString(1, gesipan.getEmail());
	      cstmt.setString(2, gesipan.getTitle());
	      cstmt.setString(3, gesipan.getContents());
	      cstmt.setInt(4, gesipan.getIdx());
	      int row = cstmt.executeUpdate();
	      
	      if(cstmt != null) cstmt.close();
	      DBClose.close(conn);
	      
	      return row;	// 업데이트 성공 시 1을 반환
	}
	
	// idx값으로 passwd 가져오기
	public static String selectPassword(int idx) throws SQLException{
	      Connection conn = DBConnection.getConnection();
	      String sql = "{ call board_select_passwd(?,?) }";
	      CallableStatement cstmt = conn.prepareCall(sql);
	      cstmt.setInt(1, idx);
	      cstmt.registerOutParameter(2, Types.VARCHAR);
	      cstmt.executeUpdate();
	      String dbpasswd = cstmt.getString(2);
	      if(cstmt != null) cstmt.close();
	      DBClose.close(conn);
	      return dbpasswd;
	   }
	
	
	
	public static int delete(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_delete(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
	
	//조회수 증가
	public static void readnumUpdate(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_readnum_update(?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
	}
	
	//idx값으로 게시판 모든 정보 받아오기 
	public static GesipanVO select(int idx) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{ call board_select(?, ?) }";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setInt(1, idx);
		cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();   //매우 중요.
		ResultSet rs = (ResultSet)cstmt.getObject(2);
		rs.next();
		GesipanVO gesipan = new GesipanVO();
		gesipan.setName(rs.getString("name"));
		gesipan.setEmail(rs.getString("email"));
		gesipan.setTitle(rs.getString("title"));
		gesipan.setContents(rs.getString("contents"));
		gesipan.setWritedate(rs.getDate("writedate"));
		gesipan.setReadnum(rs.getInt("readnum"));
		gesipan.setFilename(rs.getString("filename"));
		gesipan.setGrp(rs.getInt("grp"));
		gesipan.setLev(rs.getInt("lev"));
		gesipan.setStep(rs.getInt("step"));
		if(rs != null) rs.close();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return gesipan;
	}
		
	public static Vector<GesipanVO> selectAll() throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call board_selectAll(?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
		cstmt.executeUpdate();
		ResultSet rs = (ResultSet)cstmt.getObject(1);
		Vector<GesipanVO> vector = new Vector<GesipanVO>(1,1);
		if(!rs.next()) { // 현재 한 개의 글이라도 없다면
			vector = null;
		}else { //글이 한 개라도 있다면
			do {
				GesipanVO gesipan = new GesipanVO();
				gesipan.setIdx(rs.getInt("idx"));
				gesipan.setName(rs.getString("name"));
				gesipan.setEmail(rs.getString("email"));
				gesipan.setTitle(rs.getString("title"));
				gesipan.setWritedate(rs.getDate("writedate"));
				gesipan.setReadnum(rs.getInt("readnum"));
				vector.addElement(gesipan);
			}while(rs.next());
		}
		if(rs != null) rs.close();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return vector;
	}
	
	public static int insert(GesipanVO gesipan) throws SQLException{
		Connection conn = DBConnection.getConnection();
		String sql = "{call board_insert(?,?,?,?,?,?)}";
		CallableStatement cstmt = conn.prepareCall(sql);
		cstmt.setString(1, gesipan.getName());
		cstmt.setString(2, gesipan.getPasswd());
		cstmt.setString(3, gesipan.getEmail());
		cstmt.setString(4, gesipan.getTitle());
		cstmt.setString(5, gesipan.getContents());
		cstmt.setString(6, gesipan.getFilename());
		int row = cstmt.executeUpdate();
		if(cstmt != null) cstmt.close();
		DBClose.close(conn);
		return row;
	}
}
