package kr.co.ictedu.main;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
public class MainController {

	private final static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MainService service;
	
	@RequestMapping( value = "/adver", method = RequestMethod.GET )
	public String adver() {
		return "/adver";//jsp 파일 이름
	}//adver
	
	@RequestMapping( value = "/id_chk", method = RequestMethod.GET )
	public void idCheck( String mid, PrintWriter out ) {
		int isYN = 0;
		isYN = service.idCheck( mid );
		out.print(isYN);
		out.close();
	}//idCheck
	
	
	@RequestMapping( value = "/loginform", method = RequestMethod.GET )
	public String login(String btnradio, Model model ) {
		model.addAttribute("btnradioValue", btnradio);
		return "/loginform";//jsp 파일 이름
	}//login
	
	@RequestMapping( value = "/signupform", method = RequestMethod.GET )
	public String signup(String btnradio, Model model ) {
		model.addAttribute("btnradioValue2", btnradio);
		return "/signupform";//jsp 파일 이름
	}//
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join(dto);
		out.print(successCount);
		out.close();
	}//join
	
	@RequestMapping( value = "/callback", method = RequestMethod.GET )
	public String callback() {
		return "/callback";//jsp 파일 이름
	}//test1
	
	@RequestMapping( value = "/naverlogin", method = RequestMethod.GET )
	public String naverlogin() {
		return "/naverlogin";//jsp 파일 이름
	}//test2
}//class

