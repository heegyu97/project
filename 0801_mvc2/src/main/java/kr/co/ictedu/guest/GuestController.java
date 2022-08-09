package kr.co.ictedu.guest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import kr.co.ictedu.util.dto.SearchDTO;

@Controller
public class GuestController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	
	
	@RequestMapping(value = "productList", method = RequestMethod.GET )	
	public String productList() {
		return "/guest/productList";//jsp file name
	}//productList
	
}//class
