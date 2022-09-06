package kr.co.ictedu.space;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.SpaceDTO;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {

	private final static Logger logger = LoggerFactory.getLogger(SpaceController.class);
	
	@Autowired
	private SpaceService service;
	
	
	//방리스트 불러오기
	@RequestMapping(value = "/spacelist",method = RequestMethod.GET)
	public String spaceList(Model model, SpaceDTO dto) {
		List<SpaceDTO> list=null;
		list=service.list();
		model.addAttribute("list", list);
		
		
		
		return"/space/spacelist";
	}//spaceList
	
	
}//class
