package com.example.libs.controller;

import com.example.libs.model.TrainDTO;

public class CalcController {
   //계산해서 나머지 값들을 setting해주는 class
   
   private SelectController select;
   
   public CalcController() {   //Constructor
      select = new SelectController();
      //CalcController 생성자가 호출될 때 select를 초기화
   }
   public void calc(TrainDTO train) {
      //4개의 입력정보를 가지고 들어온 매개변수 train   
      String place = train.getPlace(); //장소코드
      String area = this.select.selectPlace(place); //지역(장소명) 구하기
       train.setArea(area); // 지역(장소명) 세팅
       
       String zumin1 = train.getZumin1();
       String zumin2 = train.getZumin2();
       String zumin = zumin1 + "-" +zumin2; 
       String sex = zumin.substring(7); // 성별 구하기 
       train.setSex(sex); // 성별 세팅
       
       String t_code = train.getTscode().substring(0, 1); //열차코드
       String tname = this.select.selectTname(t_code); // 열차명 구하기
       train.setTname(tname); // 열차명 세팅
       
       String s_code = train.getTscode().substring(2, 3); // 좌석코드
       String seat = this.select.selectSeat(s_code); // 좌석 구하기
       train.setSeat(seat); //좌석 세팅
       
       String hal = train.getHal(); // 할증 코드
       String hal_kind = this.select.selectHal(hal); // 할증종류 구하기
       train.setHal_kind(hal_kind); // 할증 종류 세팅
       
       int fee1 = this.select.selectDistance(place); // 장소코드로 거리(fee1) 구하기
       int danga = this.select.selectDanga(tname,seat); // 기차명과 좌석으로 km 당 단가 구하기
       int fee2 = fee1 * danga ; // 금액 = 거리 * km당 단가
       
       int halin = this.select.selectHalin(hal); // 할증코드로 할인률 구하기
       int discount = fee2 * halin; // 할증(할인액) = 금액 * 할인율
       train.setDiscount(discount); // 할인액(할증) 세팅
       
       int trainfee = fee2 - discount;// 차비 = 금액 - 할증
       train.setFee(trainfee); // 차비 세팅      
   }
}