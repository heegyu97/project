package kr.co.ictedu.event;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.guest.GuestController;

@Controller
public class EventController {


	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class); 
	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event() {
		return "/event/event";//jsp 파일 이름
	
	}//main
	
	@RequestMapping(value = "/event/eventdetail_tip", method = RequestMethod.GET)
	public String eventdetail_tip() {
		
		return "/event/eventdetail_tip";//jsp 파일 이름
		
	}//eventdetail_tip
	
	@RequestMapping(value = "/event/eventdetail_sus", method = RequestMethod.GET)
	public String eventdetail_sus() {
		return "/event/eventdetail_sus";//jsp 파일 이름
		
	}//eventdetail_sus
	
	@RequestMapping(value = "/event/eventdetail_point", method = RequestMethod.GET)
	public String eventdetail_point() {
		return "/event/eventdetail_point";//jsp 파일 이름
		
	}//eventdetail_point
	
	@RequestMapping(value = "/event/event_seller", method = RequestMethod.GET)
	public String event_seller() {
		return "/event/event_seller";//jsp 파일 이름
		
	}//event_seller
	@RequestMapping(value = "/event/event_manager", method = RequestMethod.GET)
	public String event_admin() {
		return "/event/event_manager";//jsp 파일 이름
		
	}//event_admin
	
	@RequestMapping(value = "/event/event_form", method = RequestMethod.GET)
	public String event_form() {
		return "/event/event_form";//jsp 파일 이름
		
	}//event_form
}//class
