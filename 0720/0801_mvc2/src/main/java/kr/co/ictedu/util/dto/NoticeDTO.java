package kr.co.ictedu.util.dto;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {

	
	private String noti_no;
	private String noti_title;
	private String noti_date;
	private String noti_ctnts;
	private String noti_view_cnt;
	private MultipartFile upload_file;
	private String noti_path;
	private String noti_pic;
	private String m_no;
	private String m_id;
	
	
	
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
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getNoti_path() {
		return noti_path;
	}
	public void setNoti_path(String noti_path) {
		this.noti_path = noti_path;
	}
	public String getNoti_pic() {
		return noti_pic;
	}
	public void setNoti_pic(String noti_pic) {
		this.noti_pic = noti_pic;
	}
	public String getM_no() {
		return m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	
	
	
}//class
