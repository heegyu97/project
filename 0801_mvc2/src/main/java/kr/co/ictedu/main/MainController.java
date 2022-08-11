package kr.co.ictedu.main;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.SearchDTO;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping( value = "/adver", method = RequestMethod.GET )
	public String adver() {
		return "/adver";//jsp 파일 이름
	}//adver

	@RequestMapping( value = "/loginform", method = RequestMethod.GET )
	public String login() {
		return "/loginform";//jsp 파일 이름
	}//login
	
	@RequestMapping( value = "/signupform", method = RequestMethod.GET )
	public String signup(String btnradio, Model model ) {
		model.addAttribute("btnradioValue2", btnradio);
		return "/signupform";//jsp 파일 이름
	}//
	@RequestMapping( value = "/event", method = RequestMethod.GET )
	public String event() {
		return "/event";//jsp 파일 이름
	}//
	
	@RequestMapping( value = "/callback", method = RequestMethod.GET )
	public String callback() {
		return "/callback";//jsp 파일 이름
	}//test1
	
	@RequestMapping( value = "/naverlogin", method = RequestMethod.GET )
	public String naverlogin() {
		return "/naverlogin";//jsp 파일 이름
	}//test2
}//class

