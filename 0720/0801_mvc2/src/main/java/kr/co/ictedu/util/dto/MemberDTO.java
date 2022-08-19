package kr.co.ictedu.util.dto;

public class MemberDTO {

	private String m_no; //회원번호
	private String m_type; //유형
	private String m_id; //아이디
	private String m_pwd; //비번
	private String m_name; //이름
	private String m_tel; //전화번호 ( tel1 + tel2 + tel3 )
	private String m_email; //이메일 (email1 + email2 )
	private String m_date; //등록일

	private String m_service_agree; //서비스 동의
	private String m_info_agree; //개인정보 동의
	private String m_sms_agree; //sms 수신 동의
	private String m_email_agree; //이메이 수신 동의
	 
	private String tel1; 
	private String tel2;
	private String tel3;
	private String email1;
	private String email2;

	private String post_code; //우편번호
	private String addr1; //주소
	private String addr2; //상세주소
	
	private String m_public_code; //공인인증 키
	
	private String m_h_no; //회사번호
	private String m_h_name; //회사이름
	private String m_h_tel; //회사전화번호
	private String m_h_email; //회사이메일
	
	private String m_cat_age; //고양이 연령
	private String m_cat_sex; //고양이 성별
	private String m_nuet_yn; //중성화 유무
	
	private String m_con_key; //관리자 고유키
	private String m_m; //회원 마일리지
	
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getM_type() {
		return m_type;
	}
	public void setM_type(String m_type) {
		this.m_type = m_type;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getM_service_agree() {
		return m_service_agree;
	}
	public void setM_service_agree(String m_service_agree) {
		this.m_service_agree = m_service_agree;
	}
	public String getM_info_agree() {
		return m_info_agree;
	}
	public void setM_info_agree(String m_info_agree) {
		this.m_info_agree = m_info_agree;
	}
	public String getM_sms_agree() {
		return m_sms_agree;
	}
	public void setM_sms_agree(String m_sms_agree) {
		this.m_sms_agree = m_sms_agree;
	}
	public String getM_email_agree() {
		return m_email_agree;
	}
	public void setM_email_agree(String m_email_agree) {
		this.m_email_agree = m_email_agree;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getM_public_code() {
		return m_public_code;
	}
	public void setM_public_code(String m_public_code) {
		this.m_public_code = m_public_code;
	}
	public String getM_h_no() {
		return m_h_no;
	}
	public void setM_h_no(String m_h_no) {
		this.m_h_no = m_h_no;
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
	public String getM_h_email() {
		return m_h_email;
	}
	public void setM_h_email(String m_h_email) {
		this.m_h_email = m_h_email;
	}
	public String getM_cat_age() {
		return m_cat_age;
	}
	public void setM_cat_age(String m_cat_age) {
		this.m_cat_age = m_cat_age;
	}
	public String getM_cat_sex() {
		return m_cat_sex;
	}
	public void setM_cat_sex(String m_cat_sex) {
		this.m_cat_sex = m_cat_sex;
	}
	public String getM_nuet_yn() {
		return m_nuet_yn;
	}
	public void setM_nuet_yn(String m_nuet_yn) {
		this.m_nuet_yn = m_nuet_yn;
	}
	public String getM_con_key() {
		return m_con_key;
	}
	public void setM_con_key(String m_con_key) {
		this.m_con_key = m_con_key;
	}
	public String getM_m() {
		return m_m;
	}
	public void setM_m(String m_m) {
		this.m_m = m_m;
	}
	

}//class

/*
 * DTO의 종류
 * 1. Table DTO : 테이블 컬럼과 동일한 변수를 갖는 DTO
 * 2. View DTO : 화면 요소와 동일한 변수를 갖는 DTO
 * 3. Composite DTO : 복합적인 변수를 갖는 DTO
 * -> 결론은 개발자 맘대로 만드시면 되요.
 */
