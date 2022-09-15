package kr.co.ictedu.space;

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

import com.google.gson.Gson;

import kr.co.ictedu.util.dto.RoomDTO;
import kr.co.ictedu.util.dto.CntsDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.OptionDTO;

@Controller
@RequestMapping(value = "/space")
public class SpaceController {

	private final static Logger logger = LoggerFactory.getLogger(SpaceController.class);
	
	@Autowired
	private SpaceService service;
	
	
	
	
	//옵션불러오기
	@RequestMapping(value = "/option", method = RequestMethod.GET)
	public void option(String r_op1 , PrintWriter out) {
		List<OptionDTO> list = null;
		list = service.oplist(r_op1);
		out.print(new Gson().toJson(list));
		out.close();
	}
	
	//방리스트 불러오기
	@RequestMapping(value = "/spacelist",method = RequestMethod.GET)
	public String spaceList(Model model, String r_no, HttpSession session) {
		
		RoomDTO dto = null;
		dto = service.roomlist(r_no);
		//System.out.println(dto);
		model.addAttribute("r_dto", dto);
		
		int totalcount = 0;
		totalcount = service.roomlistCount(r_no);
		model.addAttribute("totalcount", totalcount);
		
		List<CntsDTO> list=null;
		
		//dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
		list = service.list(r_no);
		model.addAttribute("list", list);
		
		return"/space/spacelist";
	}//spaceList
	
	//방form들어가기
	@RequestMapping(value = "/spaceform", method=RequestMethod.GET)
	public String spaceForm() {
		
		return"/space/spaceform";
	}//spaceForm
	
	//방생성
	@RequestMapping(value = "/spaceinsert", method = RequestMethod.POST)
	public void spaceInsert( RoomDTO dto, PrintWriter out, HttpSession session) {
		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
		
	}//spaceInsert
	
	
	//롤링 방생성
	
	
	
}//class
