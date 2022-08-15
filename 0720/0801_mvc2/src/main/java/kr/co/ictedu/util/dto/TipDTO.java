package kr.co.ictedu.util.dto;

import org.springframework.web.multipart.MultipartFile;

public class TipDTO {

	
	private String tip_no;
	private String tip_title;
	private String tip_writer;
	private String tip_ctnts;
	private String tip_date;
	private String tip_view_cnt;
	private MultipartFile tip_prdt_picture;
	private MultipartFile upload_file;
	private String tip_prdt_pic;
	private String tip_prdt_path;
	
	@Override
	public String toString() {
		return tip_title + ":" + tip_ctnts;
	}
	
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	
	public String getTip_no() {
		return tip_no;
	}
	public void setTip_no(String tip_no) {
		this.tip_no = tip_no;
	}
	public String getTip_title() {
		return tip_title;
	}
	public void setTip_title(String tip_title) {
		this.tip_title = tip_title;
	}
	public String getTip_writer() {
		return tip_writer;
	}
	public void setTip_writer(String tip_writer) {
		this.tip_writer = tip_writer;
	}
	public String getTip_ctnts() {
		return tip_ctnts;
	}
	public void setTip_ctnts(String tip_ctnts) {
		this.tip_ctnts = tip_ctnts;
	}
	public String getTip_date() {
		return tip_date;
	}
	public void setTip_date(String tip_date) {
		this.tip_date = tip_date;
	}
	public String getTip_view_cnt() {
		return tip_view_cnt;
	}
	public void setTip_view_cnt(String tip_view_cnt) {
		this.tip_view_cnt = tip_view_cnt;
	}
	public MultipartFile getTip_prdt_picture() {
		return tip_prdt_picture;
	}
	public void setTip_prdt_picture(MultipartFile tip_prdt_picture) {
		this.tip_prdt_picture = tip_prdt_picture;
	}
	public String getTip_prdt_pic() {
		return tip_prdt_pic;
	}
	public void setTip_prdt_pic(String tip_prdt_pic) {
		this.tip_prdt_pic = tip_prdt_pic;
	}
	public String getTip_prdt_path() {
		return tip_prdt_path;
	}
	public void setTip_prdt_path(String tip_prdt_path) {
		this.tip_prdt_path = tip_prdt_path;
	}
	
	
	
	
	
	
	
}//class
