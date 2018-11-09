package com.example.libs.model;

public class TrainDTO {
   private String tscode; //열차 좌석코드
   private String place; // 장소코드
   private String zumin1; //주민번호
   private String zumin2; //주민번호
   private String hal; // 할증코드
   private String area; //지역(장소명)
   private String sex; // 성별
   private String tname; // 열차명
   private String seat; // 좌석
   private String hal_kind; //할증종류
   private int discount; //할인액
   private int fee; //차비 
   
   
   public TrainDTO() { //디폴트 생성자
      
   }
   public TrainDTO(String tscode, String place, String zumin1,String zumin2, String hal) { // 초기 입력 전용 생성자
      this.tscode = tscode;
      this.place = place;
      this.zumin1 = zumin1;
      this.zumin2 = zumin2;
      this.hal = hal;
   }
   
   public TrainDTO(String area, String sex, String tname, String seat, String hal_kind, int discount, int fee) {
      this.area = area;
      this.sex = sex;
      this.tname = tname;
      this.seat = seat;
      this.hal_kind = hal_kind;
      this.discount = discount;
      this.fee = fee;
   }
   
   public String getTscode() {
      return tscode;
   }
   public void setTscode(String tscode) {
      this.tscode = tscode;
   }
   public String getPlace() {
      return place;
   }
   public void setPlace(String place) {
      this.place = place;
   }
   public String getHal() {
      return hal;
   }
   public void setHal(String hal) {
      this.hal = hal;
   }
   public String getArea() {
      return area;
   }
   public void setArea(String area) {
      this.area = area;
   }
   public String getSex() {
      return sex;
   }
   public void setSex(String sex) {
      this.sex = sex;
   }
   public String getTname() {
      return tname;
   }
   public void setTname(String tname) {
      this.tname = tname;
   }
   public String getSeat() {
      return seat;
   }
   public void setSeat(String seat) {
      this.seat = seat;
   }
   public String getHal_kind() {
      return hal_kind;
   }
   public void setHal_kind(String hal_kind) {
      this.hal_kind = hal_kind;
   }
   public int getDiscount() {
      return discount;
   }
   public void setDiscount(int discount) {
      this.discount = discount;
   }
   public String getZumin1() {
      return zumin1;
   }
   public void setZumin1(String zumin1) {
      this.zumin1 = zumin1;
   }
   public String getZumin2() {
      return zumin2;
   }
   public void setZumin2(String zumin2) {
      this.zumin2 = zumin2;
   }
   public int getFee() {
      return fee;
   }
   public void setFee(int fee) {
      this.fee = fee;
   }
   
   
}