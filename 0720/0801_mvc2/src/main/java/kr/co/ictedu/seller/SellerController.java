package kr.co.ictedu.seller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/seller")
public class SellerController {
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form() {
		return "/seller/form";//jsp file name
	}//form
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET )	
	public String productList() {
		return "/seller/productList";//jsp file name
	}//productList
	
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public String sellerMain() {
		return "/seller/sellerMain";//jsp file name
	}//main
	
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET )	
	public String myPage() {
		return "/seller/myPage";//jsp file name
	}//productList
	
	@RequestMapping(value = "/myPrivacy", method = RequestMethod.GET )	
	public String myPrivacy() {
		return "/seller/myPrivacy";//jsp file name
	}//productList
	
	
}//class
