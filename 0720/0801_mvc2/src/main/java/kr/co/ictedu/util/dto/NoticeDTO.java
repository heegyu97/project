package kr.co.ictedu.util.dto;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {

	
	private String noti_no;
	private String noti_title;
	private String noti_date;
	private String noti_ctnts;
	private String noti_view_cnt;
	private MultipartFile noti_pic;
	private String noti_path;
	
	public String getNoti_no() {
		return noti_no;
	}
	public void setNoti_no(String noti_no) {
		this.noti_no = noti_no;
	}
	public String getNoti_title() {
		return noti_title;
	}
	public void setNoti_title(String noti_title) {
		this.noti_title = noti_title;
	}
	public String getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(String noti_date) {
		this.noti_date = noti_date;
	}
	public String getNoti_ctnts() {
		return noti_ctnts;
	}
	public void setNoti_ctnts(String noti_ctnts) {
		this.noti_ctnts = noti_ctnts;
	}
	public String getNoti_view_cnt() {
		return noti_view_cnt;
	}
	public void setNoti_view_cnt(String noti_view_cnt) {
		this.noti_view_cnt = noti_view_cnt;
	}
	public MultipartFile getNoti_pic() {
		return noti_pic;
	}
	public void setNoti_pic(MultipartFile noti_pic) {
		this.noti_pic = noti_pic;
	}
	public String getNoti_path() {
		return noti_path;
	}
	public void setNoti_path(String noti_path) {
		this.noti_path = noti_path;
	}
	
	
	
}//class
