package kr.co.ictedu.util.dto;

public class HistoryDTO {
	//주문
	   private String ord_no;       //주문 번호
	   private String m_no;      //주문자 회뭔 번호
	   private String m_id;      //주문자 회원 아이디
	   private String ord_card_no;    //주문자카드등록번호//card_no
	   private String ord_addr_no;    //주문자 배송지번호//addr_no
	   private String ord_stock;    //총 주문 상품 수//order_product_cnt
	   private String ord_sum;      //주문금액//order_amt
	   private String ord_dc_pay;   //할인 금액//discount_amt
	   private String ord_pay;    //결제금액//pay_amt
	   private String ord_date;   //주문날짜
	   private String ord_status;   //주문 상태
	   private String order_status_name; //order_status_name //??
	   
	   //주문상품
	   private String ordpro_no;    //주문 상세번호//detail_no
	   private String pro_no;      //상품번호
	   
	   private String ordpro_stock;   //상품 수량//detail_qty
	   private String ordpro_price;     //판매 단가//detail_price
	   private String ordpro_sum;      //상세주문 금액//detail_amt
	   private String ordpro_dc;      //상세할인율//detail_discount
	   private String ordpro_dc_pay;   //상세할인 금액//detail_discount_amt
	   private String ordpro_pay;      //상세결제 금액//detail_pay_amt
	   //상품
	   private String pro_name;      //상품명
	   private String pro_thum_pic;   //썸네일 이미지 이름//thumbnail_name
	   private String pro_thum_path;   //썸네일 이미지 경로//thumbnail_path
	   
	   private String seller_mno;   //판매자 회원 번호   
	   private String seller_mid;   //판매자 회원 아이디
	   //배송지
	   private String recipient_name;   //받는사람
	   private String tel;            //받는사람 전화번호
	   private String post_code;      //받는사람 우편번호
	   private String addr1;         //받는사람 주소
	   private String addr2;         //받는사람 상세주소
	   
	
	   private String ord_memo;//??
	
	
	
	
	   private String addr_name;//??
	   private String code_name;//??
	public String getOrd_no() {
		return ord_no;
	}
	public String getM_no() {
		return m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public String getOrd_card_no() {
		return ord_card_no;
	}
	public String getOrd_addr_no() {
		return ord_addr_no;
	}
	public String getOrd_stock() {
		return ord_stock;
	}
	public String getOrd_sum() {
		return ord_sum;
	}
	public String getOrd_dc_pay() {
		return ord_dc_pay;
	}
	public String getOrd_pay() {
		return ord_pay;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public String getOrder_status_name() {
		return order_status_name;
	}
	public String getOrdpro_no() {
		return ordpro_no;
	}
	public String getPro_no() {
		return pro_no;
	}
	public String getOrdpro_stock() {
		return ordpro_stock;
	}
	public String getOrdpro_price() {
		return ordpro_price;
	}
	public String getOrdpro_sum() {
		return ordpro_sum;
	}
	public String getOrdpro_dc() {
		return ordpro_dc;
	}
	public String getOrdpro_dc_pay() {
		return ordpro_dc_pay;
	}
	public String getOrdpro_pay() {
		return ordpro_pay;
	}
	public String getPro_name() {
		return pro_name;
	}
	public String getPro_thum_pic() {
		return pro_thum_pic;
	}
	public String getPro_thum_path() {
		return pro_thum_path;
	}
	public String getSeller_mno() {
		return seller_mno;
	}
	public String getSeller_mid() {
		return seller_mid;
	}
	public String getRecipient_name() {
		return recipient_name;
	}
	public String getTel() {
		return tel;
	}
	public String getPost_code() {
		return post_code;
	}
	public String getAddr1() {
		return addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public String getOrd_memo() {
		return ord_memo;
	}
	public String getAddr_name() {
		return addr_name;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public void setOrd_card_no(String ord_card_no) {
		this.ord_card_no = ord_card_no;
	}
	public void setOrd_addr_no(String ord_addr_no) {
		this.ord_addr_no = ord_addr_no;
	}
	public void setOrd_stock(String ord_stock) {
		this.ord_stock = ord_stock;
	}
	public void setOrd_sum(String ord_sum) {
		this.ord_sum = ord_sum;
	}
	public void setOrd_dc_pay(String ord_dc_pay) {
		this.ord_dc_pay = ord_dc_pay;
	}
	public void setOrd_pay(String ord_pay) {
		this.ord_pay = ord_pay;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public void setOrder_status_name(String order_status_name) {
		this.order_status_name = order_status_name;
	}
	public void setOrdpro_no(String ordpro_no) {
		this.ordpro_no = ordpro_no;
	}
	public void setPro_no(String pro_no) {
		this.pro_no = pro_no;
	}
	public void setOrdpro_stock(String ordpro_stock) {
		this.ordpro_stock = ordpro_stock;
	}
	public void setOrdpro_price(String ordpro_price) {
		this.ordpro_price = ordpro_price;
	}
	public void setOrdpro_sum(String ordpro_sum) {
		this.ordpro_sum = ordpro_sum;
	}
	public void setOrdpro_dc(String ordpro_dc) {
		this.ordpro_dc = ordpro_dc;
	}
	public void setOrdpro_dc_pay(String ordpro_dc_pay) {
		this.ordpro_dc_pay = ordpro_dc_pay;
	}
	public void setOrdpro_pay(String ordpro_pay) {
		this.ordpro_pay = ordpro_pay;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public void setPro_thum_pic(String pro_thum_pic) {
		this.pro_thum_pic = pro_thum_pic;
	}
	public void setPro_thum_path(String pro_thum_path) {
		this.pro_thum_path = pro_thum_path;
	}
	public void setSeller_mno(String seller_mno) {
		this.seller_mno = seller_mno;
	}
	public void setSeller_mid(String seller_mid) {
		this.seller_mid = seller_mid;
	}
	public void setRecipient_name(String recipient_name) {
		this.recipient_name = recipient_name;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public void setOrd_memo(String ord_memo) {
		this.ord_memo = ord_memo;
	}
	public void setAddr_name(String addr_name) {
		this.addr_name = addr_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	
	
	
	
	
}//class
