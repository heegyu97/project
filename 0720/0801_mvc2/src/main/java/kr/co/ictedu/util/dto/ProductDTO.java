package kr.co.ictedu.util.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	
	private String pro_no;		//상품번호
	private String pro_big; 	//대분류
	private String pro_mid;		//중분류
	private String pro_age;		//연령분류
	private String pro_name;	//상품이름
	private String pro_date;	//등록일
	private String pro_stock;	//재고수량
	private String pro_price;	//단가
	
	private String pro_dc;			//할인률
	private String pro_dc_strt;		//할인시작일
	private String pro_dc_end;		//할인마지막일
	private String pro_ship;		//배송비
	private String pro_ship_free;	//배송무료 해당금액
	private String pro_thum_pic;	//썸네일 이름
	private String pro_thum_path;	//썸네일 경로
	private String pro_prdt_pic;	//설명이미지 이름
	private String pro_prdt_path;	//설명이미지 경로
	
	private MultipartFile thumbnail;	//썸네일 저장
	private MultipartFile prdt_img;		//설명이미지 저장
	
	private String pro_ctnts;	//상세설명
	private String pro_view_cnt;//조회수
	private String m_no; //판매자 번호
	private String m_id; //판매자 아이디
	
	private String b_no; //장바구니 번호
	private String b_stock;// 상품수
	private String total_pay;// 총가격
	private String total_dc;// 총 할인가격
	
	
	@Override
	public String toString() {
		return pro_no + " : " + pro_name ;
	}
	public String getPro_no() {
		return pro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_big() {
		return pro_big;
	}
	public void setPro_big(String pro_big) {
		this.pro_big = pro_big;
	}
	public String getPro_mid() {
		return pro_mid;
	}
	public void setPro_mid(String pro_mid) {
		this.pro_mid = pro_mid;
	}
	public String getPro_age() {
		return pro_age;
	}
	public void setPro_age(String pro_age) {
		this.pro_age = pro_age;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_date() {
		return pro_date;
	}
	public void setPro_date(String pro_date) {
		this.pro_date = pro_date;
	}
	public String getPro_stock() {
		return pro_stock;
	}
	public void setPro_stock(String pro_stock) {
		this.pro_stock = pro_stock;
	}
	public String getPro_price() {
		return pro_price;
	}
	public void setPro_price(String pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_dc() {
		return pro_dc;
	}
	public void setPro_dc(String pro_dc) {
		this.pro_dc = pro_dc;
	}
	public String getPro_dc_strt() {
		return pro_dc_strt;
	}
	public void setPro_dc_strt(String pro_dc_strt) {
		this.pro_dc_strt = pro_dc_strt;
	}
	public String getPro_dc_end() {
		return pro_dc_end;
	}
	public void setPro_dc_end(String pro_dc_end) {
		this.pro_dc_end = pro_dc_end;
	}
	public String getPro_ship() {
		return pro_ship;
	}
	public void setPro_ship(String pro_ship) {
		this.pro_ship = pro_ship;
	}
	public String getPro_ship_free() {
		return pro_ship_free;
	}
	public void setPro_ship_free(String pro_ship_free) {
		this.pro_ship_free = pro_ship_free;
	}
	public String getPro_thum_pic() {
		return pro_thum_pic;
	}
	public void setPro_thum_pic(String pro_thum_pic) {
		this.pro_thum_pic = pro_thum_pic;
	}
	public String getPro_thum_path() {
		return pro_thum_path;
	}
	public void setPro_thum_path(String pro_thum_path) {
		this.pro_thum_path = pro_thum_path;
	}
	public String getPro_prdt_pic() {
		return pro_prdt_pic;
	}
	public void setPro_prdt_pic(String pro_prdt_pic) {
		this.pro_prdt_pic = pro_prdt_pic;
	}
	public String getPro_prdt_path() {
		return pro_prdt_path;
	}
	public void setPro_prdt_path(String pro_prdt_path) {
		this.pro_prdt_path = pro_prdt_path;
	}
	public MultipartFile getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(MultipartFile thumbnail) {
		this.thumbnail = thumbnail;
	}
	public MultipartFile getPrdt_img() {
		return prdt_img;
	}
	public void setPrdt_img(MultipartFile prdt_img) {
		this.prdt_img = prdt_img;
	}
	public String getPro_ctnts() {
		return pro_ctnts;
	}
	public void setPro_ctnts(String pro_ctnts) {
		this.pro_ctnts = pro_ctnts;
	}
	public String getPro_view_cnt() {
		return pro_view_cnt;
	}
	public void setPro_view_cnt(String pro_view_cnt) {
		this.pro_view_cnt = pro_view_cnt;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getB_stock() {
		return b_stock;
	}
	public void setB_stock(String b_stock) {
		this.b_stock = b_stock;
	}
	public String getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(String total_pay) {
		this.total_pay = total_pay;
	}
	public String getTotal_dc() {
		return total_dc;
	}
	public void setTotal_dc(String total_dc) {
		this.total_dc = total_dc;
	}
	
	
}//class
