package kr.co.ictedu.util.dto;

public class CommenCodeDTO {

	private String code_no;
	private String code_class;
	private String code_name;
	
	@Override
	public String toString() {
		
		return "c_no : " +code_no + ", c_class : " + code_class + ", c_name : " + code_name;
	}
	
	public String getCode_no() {
		return code_no;
	}
	public void setCode_no(String code_no) {
		this.code_no = code_no;
	}
	public String getCode_class() {
		return code_class;
	}
	public void setCode_class(String code_class) {
		this.code_class = code_class;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	
	
}//class
