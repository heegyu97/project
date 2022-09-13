package kr.co.ictedu.main;


import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.RoomDTO;



@Controller
@RequestMapping( value = "/main" )
public class SelectController {
	
	@Autowired
	private SelectService service;
	
	private static final Logger logger = LoggerFactory.getLogger(SelectController.class);
	
	@RequestMapping( value = "/select", method = RequestMethod.GET )
	public String list( Model model ) {
		
		List<RoomDTO> list = null;
		list = service.list();
		model.addAttribute("list", list);
		return "/main/select";// jsp file name
	}//list
	
	  
	
	
			
			
			

		
		
	
		
		
	
	

}//class
