package kr.co.ictedu.event;

public class EventDTO {
	
	private String evnt_no;
	private String evnt_title;
	private String event_strt;
	private String evnt_end;
	private String evnt_pic;
	private String evnt_pic_path;
	private String evnt_thum_name;
	private String evnt_ctnts;
	
	public String toString() {
		return evnt_no + " : " + evnt_title;
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
	public String getEvent_strt() {
		return event_strt;
	}
	public void setEvent_strt(String event_strt) {
		this.event_strt = event_strt;
	}
	public String getEvnt_end() {
		return evnt_end;
	}
	public void setEvnt_end(String evnt_end) {
		this.evnt_end = evnt_end;
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
	public String getEvnt_thum_name() {
		return evnt_thum_name;
	}
	public void setEvnt_thum_name(String evnt_thum_name) {
		this.evnt_thum_name = evnt_thum_name;
	}
	public String getEvnt_ctnts() {
		return evnt_ctnts;
	}
	public void setEvnt_ctnts(String evnt_ctnts) {
		this.evnt_ctnts = evnt_ctnts;
	}

}//class
