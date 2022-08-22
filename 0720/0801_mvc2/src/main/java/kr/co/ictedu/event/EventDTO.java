package kr.co.ictedu.event;

import org.springframework.web.multipart.MultipartFile;

public class EventDTO {
	
	private String evnt_no;
	private String evnt_title;
	private String evnt_strt;
	private String evnt_end;
	private String evnt_ctnts;
	private String m_name; 
	private String m_h_name;
	private String m_h_tel;

	private MultipartFile Upload_file;
	private String evnt_pic;
	private String evnt_pic_path;
	
	

	private MultipartFile evnt_thum_file;
	private String evnt_thum_name;
	private String evnt_thum_path;
	
	
	@Override
	public String toString() {
		return "evnt_no : " + evnt_no
				+ ", evnt_title : " + evnt_title
				+ ", evnt_strt : " + evnt_strt
				+ ", evnt_end : " + evnt_end
				+ ", evnt_ctnts : " + evnt_ctnts
				+ ", evnt_pic : " + evnt_pic
				+ ", evnt_pic_path : " + evnt_pic_path
				+ ", evnt_thum_name : " + evnt_thum_name
				+ ", evnt_thum_path : " + evnt_thum_path;
				//sql문에 추가된 변수는 이름을 안 바꿈!! 위에 띄워둔 애들을 바꿈!! 
	}


	public String getEvnt_no() {
		return evnt_no;
	}


	public void setEvnt_no(String evnt_no) {
		this.evnt_no = evnt_no;
	}


	public String getEvnt_title() {
		return evnt_title;
	}


	public void setEvnt_title(String evnt_title) {
		this.evnt_title = evnt_title;
	}


	public String getEvnt_strt() {
		return evnt_strt;
	}


	public void setEvnt_strt(String evnt_strt) {
		this.evnt_strt = evnt_strt;
	}


	public String getEvnt_end() {
		return evnt_end;
	}


	public void setEvnt_end(String evnt_end) {
		this.evnt_end = evnt_end;
	}


	public String getEvnt_ctnts() {
		return evnt_ctnts;
	}


	public void setEvnt_ctnts(String evnt_ctnts) {
		this.evnt_ctnts = evnt_ctnts;
	}


	public String getM_name() {
		return m_name;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public String getM_h_name() {
		return m_h_name;
	}


	public void setM_h_name(String m_h_name) {
		this.m_h_name = m_h_name;
	}


	public String getM_h_tel() {
		return m_h_tel;
	}


	public void setM_h_tel(String m_h_tel) {
		this.m_h_tel = m_h_tel;
	}


	public MultipartFile getUpload_file() {
		return Upload_file;
	}


	public void setUpload_file(MultipartFile upload_file) {
		Upload_file = upload_file;
	}


	public String getEvnt_pic() {
		return evnt_pic;
	}


	public void setEvnt_pic(String evnt_pic) {
		this.evnt_pic = evnt_pic;
	}


	public String getEvnt_pic_path() {
		return evnt_pic_path;
	}


	public void setEvnt_pic_path(String evnt_pic_path) {
		this.evnt_pic_path = evnt_pic_path;
	}


	public MultipartFile getEvnt_thum_file() {
		return evnt_thum_file;
	}


	public void setEvnt_thum_file(MultipartFile evnt_thum_file) {
		this.evnt_thum_file = evnt_thum_file;
	}


	public String getEvnt_thum_name() {
		return evnt_thum_name;
	}


	public void setEvnt_thum_name(String evnt_thum_name) {
		this.evnt_thum_name = evnt_thum_name;
	}


	public String getEvnt_thum_path() {
		return evnt_thum_path;
	}


	public void setEvnt_thum_path(String evnt_thum_path) {
		this.evnt_thum_path = evnt_thum_path;
	}

	

}//class
