package kr.co.ictedu.util.dto;

public class RoomDTO {
	
	private String r_no;
	private String r_title;  
	private String r_sdate;
	private String r_cdate; 
	private String r_op1; 
	private String r_op2; 
	private String r_op3; 
	private String m_no;
	
	private String r_back_img;
	private String r_list_img;
	
	private int limitNum;
	
	public String toString() {
		return r_no + " : " + r_title + " : " + r_sdate + " : " + r_cdate + " : " + r_op1 + " : " + r_op2
				+ " : " + r_op3 + " : " + m_no;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_sdate() {
		return r_sdate;
	}

	public void setR_sdate(String r_sdate) {
		this.r_sdate = r_sdate;
	}

	public String getR_cdate() {
		return r_cdate;
	}

	public void setR_cdate(String r_cdate) {
		this.r_cdate = r_cdate;
	}

	public String getR_op1() {
		return r_op1;
	}

	public void setR_op1(String r_op1) {
		this.r_op1 = r_op1;
	}

	public String getR_op2() {
		return r_op2;
	}

	public void setR_op2(String r_op2) {
		this.r_op2 = r_op2;
	}

	public String getR_op3() {
		return r_op3;
	}

	public void setR_op3(String r_op3) {
		this.r_op3 = r_op3;
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public int getLimitNum() {
		return limitNum;
	}

	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}

	public String getR_back_img() {
		return r_back_img;
	}

	public void setR_back_img(String r_back_img) {
		this.r_back_img = r_back_img;
	}

	public String getR_list_img() {
		return r_list_img;
	}

	public void setR_list_img(String r_list_img) {
		this.r_list_img = r_list_img;
	}
	

}//class
