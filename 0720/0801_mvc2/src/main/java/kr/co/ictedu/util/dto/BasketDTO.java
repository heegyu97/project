package kr.co.ictedu.util.dto;

public class BasketDTO {
	
	
		//다른테이블 pk
		private String m_no;//멤버pk
		private String pro_no;//상품정보pk
		private String ordpro_no;//주문상품테이블pk
		private String ord_no;//주문테이블pk
		private String addr_no;//배송지pk
		
		
	
	
		//장바구니 테이블 변수
		private String b_no;//장바구니 번호
		private String b_date;//장바구니 등록일
		private String b_stock;//장바구니 총수량
		
		
		//장바구니에 필요한 값들 (테이블엔 필요 없음)
		
		private String dc_pay;//실구매금액 계산 ord_sum- ord_dc_pay
		private String total_pay;//총구매금액 ord_pay * ((ord_no)count)
		private String total_dc;//총할인금액 ord_dc_pay * ((ord_no)count)
		private String total_dc_pay;//총주문금액 ord_dc_pay * ((ord_no)count)
		
		
		//주문상품테이블,주문테이블,상품정보테이블 에서  불러온 값들
		private String pro_thum_pic;//썸네일 이름
		private String pro_thum_path;//썸네일 경로
		private String pro_name;//상품명
		private String ordpro_price;//단가
		private String ordpro_stock;//구매수량
		private String ord_pay;//구매금액
		private String ord_dc_pay;//할인금액
		
		//배송지테이블에서 불러온 값들
		private String addr_name;//배송지이름  
		private String recipient_name;//받는사람  
		private String tel;//전화번호 
		private String post_code;//우편번호 
		private String addr1;//주소 
		private String addr2;//상세주소 
		
		public String getM_no() {
			return m_no;
		}
		public void setM_no(String m_no) {
			this.m_no = m_no;
		}
		public String getPro_no() {
			return pro_no;
		}
		public void setPro_no(String pro_no) {
			this.pro_no = pro_no;
		}
		public String getOrdpro_no() {
			return ordpro_no;
		}
		public void setOrdpro_no(String ordpro_no) {
			this.ordpro_no = ordpro_no;
		}
		public String getOrd_no() {
			return ord_no;
		}
		public void setOrd_no(String ord_no) {
			this.ord_no = ord_no;
		}
		public String getAddr_no() {
			return addr_no;
		}
		public void setAddr_no(String addr_no) {
			this.addr_no = addr_no;
		}
		public String getB_no() {
			return b_no;
		}
		public void setB_no(String b_no) {
			this.b_no = b_no;
		}
		public String getB_date() {
			return b_date;
		}
		public void setB_date(String b_date) {
			this.b_date = b_date;
		}
		public String getB_stock() {
			return b_stock;
		}
		public void setB_stock(String b_stock) {
			this.b_stock = b_stock;
		}
		public String getDc_pay() {
			return dc_pay;
		}
		public void setDc_pay(String dc_pay) {
			this.dc_pay = dc_pay;
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
		public String getTotal_dc_pay() {
			return total_dc_pay;
		}
		public void setTotal_dc_pay(String total_dc_pay) {
			this.total_dc_pay = total_dc_pay;
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
		public String getPro_name() {
			return pro_name;
		}
		public void setPro_name(String pro_name) {
			this.pro_name = pro_name;
		}
		public String getOrdpro_price() {
			return ordpro_price;
		}
		public void setOrdpro_price(String ordpro_price) {
			this.ordpro_price = ordpro_price;
		}
		public String getOrdpro_stock() {
			return ordpro_stock;
		}
		public void setOrdpro_stock(String ordpro_stock) {
			this.ordpro_stock = ordpro_stock;
		}
		public String getOrd_pay() {
			return ord_pay;
		}
		public void setOrd_pay(String ord_pay) {
			this.ord_pay = ord_pay;
		}
		public String getOrd_dc_pay() {
			return ord_dc_pay;
		}
		public void setOrd_dc_pay(String ord_dc_pay) {
			this.ord_dc_pay = ord_dc_pay;
		}
		public String getAddr_name() {
			return addr_name;
		}
		public void setAddr_name(String addr_name) {
			this.addr_name = addr_name;
		}
		public String getRecipient_name() {
			return recipient_name;
		}
		public void setRecipient_name(String recipient_name) {
			this.recipient_name = recipient_name;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
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
		
		
		
		
		
		
		

}//class
