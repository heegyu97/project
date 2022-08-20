package kr.co.ictedu.util.dto;

import org.springframework.web.multipart.MultipartFile;

public class TipDTO {

	
	private String tip_no;//글번호
	private String tip_title;//제목
	private String tip_writer;//작성자
	private String tip_ctnts;//내용
	private String tip_date;//등록일
	private String tip_view_cnt; //조회수
	private MultipartFile Upload_file; //이미지 이름, 이미지 경로 를 copy하기 위해 초기설정할때  테이블에는 없지만 사용함
	private String tip_prdt_pic; // 이미지 이름
	private String tip_prdt_path; //이미지 경로
	
	private String m_no; //로그인pk
	private String m_id; //로그인아이디
	private String m_name; //이름
	private String m_h_name; //회사이름
	
	
	
	
	
	@Override
	public String toString() {
		return tip_title + ":" + tip_ctnts;
	}
	
	public MultipartFile getUpload_file() {
		return Upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		Upload_file = upload_file;
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
	
	
	
	
	
	
	
}//class
