package kr.co.ictedu.guest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/guest")
public class GuestController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail() {
		return "/guest/detail";
	}//detail
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET )	
	public String productList() {
		return "/guest/productList";//jsp file name
	}//productList
	
}//class
