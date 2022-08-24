package kr.co.ictedu.util.dto;

public class SearchDTO {
	private String m_no;
	private String searchOption;
	private String searchOption2;
	private String searchOption3;
	private String searchWord;
	private int limitNum;
	public String getSearchOption() {
		return searchOption;
	}
	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getSearchOption2() {
		return searchOption2;
	}
	public void setSearchOption2(String searchOption2) {
		this.searchOption2 = searchOption2;
	}
	public String getSearchOption3() {
		return searchOption3;
	}
	public void setSearchOption3(String searchOption3) {
		this.searchOption3 = searchOption3;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getLimitNum() {
		return limitNum;
	}
	public void setLimitNum(int limitNum) {
		this.limitNum = limitNum;
	}
	

	
}//class
