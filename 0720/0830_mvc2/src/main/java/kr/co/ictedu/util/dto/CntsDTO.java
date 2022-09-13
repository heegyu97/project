package kr.co.ictedu.util.dto;

public class CntsDTO {

	private String w_no;//편지 번호
	private String w_title;//편지 제목
	private String w_cnt;//편지 내용
	private String w_link;//유튜브링크 + 사진 
	private String r_no;//방번호
	private String m_no;//편지 작성자 m_no
	
	private String r_title;
	private String r_cdate;
	
	@Override
	public String toString() {
		
		return w_no + ":" + w_title + ":" + w_cnt + ":" + w_link + ":" +r_no ;
	}
	public String getW_no() {
		return w_no;
	}
	public void setW_no(String w_no) {
		this.w_no = w_no;
	}
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}
	public String getW_cnt() {
		return w_cnt;
	}
	public void setW_cnt(String w_cnt) {
		this.w_cnt = w_cnt;
	}
	public String getW_link() {
		return w_link;
	}
	public void setW_link(String w_link) {
		this.w_link = w_link;
	}
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getR_title() {
		return r_title;
	}
	public void setR_title(String r_title) {
		this.r_title = r_title;
	}
	public String getR_cdate() {
		return r_cdate;
	}
	public void setR_cdate(String r_cdate) {
		this.r_cdate = r_cdate;
	}
	
}//class
