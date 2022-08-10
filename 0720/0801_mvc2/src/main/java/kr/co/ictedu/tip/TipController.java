package kr.co.ictedu.tip;



import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.TipDTO;

@Controller
@RequestMapping(value = "/tip")
public class TipController {
	
	private final Logger logger = LoggerFactory.getLogger(TipController.class);
	
	@Autowired
	private TipService service;
	
	
	@RequestMapping(value = "/writeform", method = RequestMethod.GET)
	public String writeForm() {
		
		return"/tip/tip_write_form";
	}//
	
	
	
	@RequestMapping(value = "/tip", method = RequestMethod.GET)
	public String tip() {
		
		
		
		return"/tip/tip";
	}//tip
	
	
	@RequestMapping(value = "/tipdetail", method = RequestMethod.GET)
	public String tipDetail() {
		
		
		//logger.info(board_no);//tip.jsp에서 값넘어오는지확인//삭제예정
		
		return"/tip/tip_detail";
	}//tipDetail
	
	@RequestMapping(value = "/tipupdate",method= RequestMethod.POST)
	public void update(TipDTO dto , PrintWriter out) {
		int successCount = 0;
		successCount=service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	
	@RequestMapping(value = "/tipupdateform", method = RequestMethod.GET )
	public String updateForm() {
		
		
		return"/tip/tip_update_form";
	}//updateForm
	
	
	
	
	
	

}//class
