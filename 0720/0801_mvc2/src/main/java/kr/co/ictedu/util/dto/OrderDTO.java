package kr.co.ictedu.util.dto;

public class OrderDTO {

	private String ord_no; 		//주문 번호
	private String m_no;				//회원번호
	private String ord_card_no;			//카드번호
	private String ord_addr_no;			//배송지 번호
	private String ord_stock;//총주문 상품 수
	private String ord_sum;		//주문금액
	private String ord_dc_pay;	//할인금액
	private String ord_pay;			//결제금액
	private String ord_date;		//주문 날짜
	private String ord_status;	//주문 상태
	//private String b_no;
	private String str_basket_no;	//
	private String [] arr_basket_no;//장바구니 번호 배열


	
	private String ord_memo;//배송메모
	@Override
	public String toString() {
		return ord_no 
				+ " : " +m_no
				+ " : " +ord_addr_no
				+ " : " +ord_stock
				+ " : " +ord_sum
				+ " : " +ord_dc_pay
				+ " : " +ord_pay
				+ " : " +ord_date
				+ " : " +ord_status
				;
	}
	
	public String getOrd_no() {
		return ord_no;
	}
	public void setOrd_no(String ord_no) {
		this.ord_no = ord_no;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getOrd_card_no() {
		return ord_card_no;
	}
	public void setOrd_card_no(String ord_card_no) {
		this.ord_card_no = ord_card_no;
	}
	public String getOrd_addr_no() {
		return ord_addr_no;
	}
	public void setOrd_addr_no(String ord_addr_no) {
		this.ord_addr_no = ord_addr_no;
	}
	public String getOrd_stock() {
		return ord_stock;
	}
	public void setOrd_stock(String ord_stock) {
		this.ord_stock = ord_stock;
	}
	public String getOrd_sum() {
		return ord_sum;
	}
	public void setOrd_sum(String ord_sum) {
		this.ord_sum = ord_sum;
	}
	public String getOrd_dc_pay() {
		return ord_dc_pay;
	}
	public void setOrd_dc_pay(String ord_dc_pay) {
		this.ord_dc_pay = ord_dc_pay;
	}
	public String getOrd_pay() {
		return ord_pay;
	}
	public void setOrd_pay(String ord_pay) {
		this.ord_pay = ord_pay;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_status() {
		return ord_status;
	}
	public void setOrd_status(String ord_status) {
		this.ord_status = ord_status;
	}
	public String getStr_basket_no() {
		return str_basket_no;
	}
	public void setStr_basket_no(String str_basket_no) {
		this.str_basket_no = str_basket_no;
	}
	public String[] getArr_basket_no() {
		return arr_basket_no;
	}
	public void setArr_basket_no(String[] arr_basket_no) {
		this.arr_basket_no = arr_basket_no;
	}
	public String getOrd_memo() {
		return ord_memo;
	}
	public void setOrd_memo(String ord_memo) {
		this.ord_memo = ord_memo;
	}

//	public String getB_no() {
//		return b_no;
//	}
//
//	public void setB_no(String b_no) {
//		this.b_no = b_no;
//	}
	

}//class
