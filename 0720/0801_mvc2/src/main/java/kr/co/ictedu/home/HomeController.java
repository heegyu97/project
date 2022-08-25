package kr.co.ictedu.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.ProductDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(String btnradio, Model model ) {
		model.addAttribute("btnradioValue", btnradio);
		
		List<ProductDTO> recencylist = null;
		recencylist = service.recencylist();
		model.addAttribute("recencylist", recencylist);
	
		List<ProductDTO> looklist = null;
		looklist = service.looklist();
		model.addAttribute("looklist", looklist);
		
		List<ProductDTO> hpricelist = null;
		hpricelist = service.hpricelist();
		model.addAttribute("hpricelist", hpricelist);
		
		List<ProductDTO> lpricelist = null;
		lpricelist = service.lpricelist();
		model.addAttribute("lpricelist", lpricelist);
		
		List<ProductDTO> hdislist = null;
		hdislist = service.hdislist();
		model.addAttribute("hdislist", hdislist);
		
		List<ProductDTO> ldislist = null;
		ldislist = service.ldislist();
		model.addAttribute("ldislist", ldislist);
		
		
		
		return "/home";
	}

	
	
}
