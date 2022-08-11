package kr.co.ictedu.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET )	
	public String myPage() {
		return "/manager/myPage";//jsp file name
	}//productList
	
	@RequestMapping(value = "/myPrivacy", method = RequestMethod.GET )	
	public String myPrivacy() {
		return "/manager/myPrivacy";//jsp file name
	}//productList
	
}