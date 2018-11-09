package com.example.libs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class TrainDAO {
   
   public static Vector<TrainDTO> selectSeoul() throws SQLException{ // 서울조희
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT paname FROM Place WHERE pcode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, "서울");
      ResultSet rs= pstmt.executeQuery();
      Vector<TrainDTO> vector = new Vector<TrainDTO>(1,1); 
      if(!rs.next()) { //데이터가 하나도 없다면
         vector = null;
      }else {//있다면
         do {
            TrainDTO train = new TrainDTO(rs.getString("area"), rs.getString("sex"), rs.getString("tname"), 
                                             rs.getString("seat"), rs.getString("hal_kind"), rs.getInt("discount"),
                                             rs.getInt("fee"));
            vector.add(train);
         }while(rs.next());
      }
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return vector; // 전체조회 한 벡터
   }
   public static Vector<TrainDTO> selectBusanl() throws SQLException{ // 부산조희
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT paname FROM Place WHERE pcode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, "부산");
      ResultSet rs= pstmt.executeQuery();
      Vector<TrainDTO> vector = new Vector<TrainDTO>(1,1); 
      if(!rs.next()) { //데이터가 하나도 없다면
         vector = null;
      }else {//있다면
         do {
            TrainDTO train = new TrainDTO(rs.getString("area"), rs.getString("sex"), rs.getString("tname"), 
                                             rs.getString("seat"), rs.getString("hal_kind"), rs.getInt("discount"),
                                             rs.getInt("fee"));
            vector.add(train);
         }while(rs.next());
      }
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return vector; // 전체조회 한 벡터
   }
   public static Vector<TrainDTO> selectDaegu() throws SQLException{ // 대구조희
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT paname FROM Place WHERE pcode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, "대구");
      ResultSet rs= pstmt.executeQuery();
      Vector<TrainDTO> vector = new Vector<TrainDTO>(1,1); 
      if(!rs.next()) { //데이터가 하나도 없다면
         vector = null;
      }else {//있다면
         do {
            TrainDTO train = new TrainDTO(rs.getString("area"), rs.getString("sex"), rs.getString("tname"), 
                                             rs.getString("seat"), rs.getString("hal_kind"), rs.getInt("discount"),
                                             rs.getInt("fee"));
            vector.add(train);
         }while(rs.next());
      }
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return vector; // 전체조회 한 벡터
   }
   public static Vector<TrainDTO> selectGwangju() throws SQLException{ // 광주조희
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT paname FROM Place WHERE pcode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, "광주");
      ResultSet rs= pstmt.executeQuery();
      Vector<TrainDTO> vector = new Vector<TrainDTO>(1,1); 
      if(!rs.next()) { //데이터가 하나도 없다면
         vector = null;
      }else {//있다면
         do {
            TrainDTO train = new TrainDTO(rs.getString("area"), rs.getString("sex"), rs.getString("tname"), 
                                             rs.getString("seat"), rs.getString("hal_kind"), rs.getInt("discount"),
                                             rs.getInt("fee"));
            vector.add(train);
         }while(rs.next());
      }
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return vector; // 전체조회 한 벡터
   }
   
   
   
   
   public static String selectPlace(String place) throws SQLException{ // 지역(장소명) 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT paname FROM Place WHERE pcode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, place);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      String place1 = rs.getString("pname");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return place1;
   }
   
   
   public static String selectTname(String t_code) throws SQLException{ // 열차명 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT tname FROM Train WHERE tcode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, t_code);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      String tname = rs.getString("tname");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return tname;
   }
   
   public static String selectSeat(String s_code) throws SQLException{ // 좌석 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT sname FROM Seat WHERE scode = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, s_code);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      String Seat = rs.getString("sname");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return Seat;
   }
   
   public static String selectHal(String hal) throws SQLException{ // 할증 종류 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT pertype  FROM Percentage WHERE percode  = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, hal);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      String pertype= rs.getString("pertype");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return pertype;
   }
   
   
   public static int selectDistance(String place) throws SQLException{ // 장소 코드로 거리 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT pkm  FROM Place WHERE pcode= ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, place);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      int pkm= rs.getInt("pkm");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return pkm;
   }
   
   public static int selectDanga(String tname,String seat) throws SQLException{ // 기차명과 좌석으로 km 당 단가 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT kmcost FROM km WHERE tname= ? AND sname= ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, tname);
      pstmt.setString(2, seat);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      int kmcost= rs.getInt("kmcost");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return kmcost;
   }

   public static int selectHalin(String hal) throws SQLException{ // 할증코드로 할인률 구하기
      Connection conn = DBConnection.getConnection();
      String sql = "SELECT percent FROM Percentage WHERE percode= ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, hal);
      ResultSet rs= pstmt.executeQuery();
      rs.next();
      int percent= rs.getInt("percent");
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close(); 
      DBClose.close(conn);
      return percent;
   }
   
   public static int insert(TrainDTO train) throws SQLException{
      Connection conn = DBConnection.getConnection();
      String sql = "INSERT INTO Reserve VALUES(?,?,?,?,?,?,?,?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, 1);
      pstmt.setString(2, train.getArea());
      pstmt.setString(3, train.getSex());
      pstmt.setString(4, train.getTname());
      pstmt.setString(5, train.getSeat());
      pstmt.setString(6, train.getHal_kind());
      pstmt.setInt(7, train.getDiscount());
      pstmt.setInt(8, train.getFee());

      int row = pstmt.executeUpdate();
      //executeUpdate를 하면 성공 행 수를 리턴 성공하면 1 
      if(pstmt != null) pstmt.close();
      DBClose.close(conn);
      return row; // 성공 시 1을 리턴
   }
}