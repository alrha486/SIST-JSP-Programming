/*who: 김현주
*when : 2018.11.09
*why : SelectController
*/

package com.example.libs.controller;

import java.sql.SQLException;
import java.util.Vector;

import com.example.libs.model.TrainDAO;
import com.example.libs.model.TrainDTO;

public class SelectController {
   
	public Vector<TrainDTO> selectSeoul(){
      Vector<TrainDTO> vector = null;
      try {
         vector = TrainDAO.selectSeoul();
      } catch (SQLException e) {
         System.out.println(e);
      }
      return vector;
   }
	
	public Vector<TrainDTO> selectBusanl(){
	      Vector<TrainDTO> vector = null;
	      try {
	         vector = TrainDAO.selectSeoul();
	      } catch (SQLException e) {
	         System.out.println(e);
	      }
	      return vector;
	   }
	
	public Vector<TrainDTO> selectDaegu(){
	      Vector<TrainDTO> vector = null;
	      try {
	         vector = TrainDAO.selectSeoul();
	      } catch (SQLException e) {
	         System.out.println(e);
	      }
	      return vector;
	   }
	
	public Vector<TrainDTO> selectGwangju(){
	      Vector<TrainDTO> vector = null;
	      try {
	         vector = TrainDAO.selectSeoul();
	      } catch (SQLException e) {
	         System.out.println(e);
	      }
	      return vector;
	   }
   
   
   
   //지역명
   public String selectPlace(String place) {
      String area=null;
      try {
         area=TrainDAO.selectPlace(place);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return area;
   }
   //열차명
   public String selectTname(String t_code) {
      String tname=null;
      try {
         tname=TrainDAO.selectTname(t_code);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return tname;
   }
   //좌석명
   public String selectSeat(String s_code) {
      String seat=null;
      try {
         seat=TrainDAO.selectSeat(s_code);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return seat;
   }
   //할증종류
   public String selectHal(String hal) {
      String hal1=null;
      try {
    	  hal1=TrainDAO.selectHal(hal);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return hal1;
   }
   //거리
   public int selectDistance(String place) {
      int distance =0;
      try {
         distance=TrainDAO.selectDistance(place);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return distance;
   }
   //단가
   public int selectDanga(String tname, String seat) {
      int danga=0;
      try {
         danga=TrainDAO.selectDanga(tname,seat);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return danga;
   }
   //할인율
   public int selectHalin(String hal) {
      int halin=0;
      try {
         halin=TrainDAO.selectHalin(hal);
      } catch (SQLException e) {
         System.out.println(e);
      }
      return halin;
   }
}