package kr.co.ictedu.cnts;

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

import kr.co.ictedu.util.dto.CntsDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.RoomDTO;

@Controller
@RequestMapping(value = "/cnts")
public class CntsConstroller {
	private final static Logger logger = LoggerFactory.getLogger(CntsConstroller.class);
	
	@Autowired
	private CntsService service;
	
	@RequestMapping(value = "/delete" , method = RequestMethod.GET)
	public void delete( CntsDTO dto, PrintWriter out, HttpSession session ) {
		dto.setM_no( ((MemberDTO) session.getAttribute("login_info")).getM_no() );
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
		
	}//delete
	
	@RequestMapping(value = "/detail" , method = RequestMethod.GET)
	public String detail( Model model , String w_no ) {
		CntsDTO dto = null;
		dto = service.detail(w_no);
		System.out.println("w_no" + w_no);
		model.addAttribute("dto", dto);
		
		return "/cnts/detail";
	}//detail
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert( String r_no,CntsDTO dto, PrintWriter out, HttpSession session ) {
		int successCount = 0;
		dto.setR_no(r_no);
		dto.setM_no( ((MemberDTO) session.getAttribute("login_info")).getM_no() );
		dto.setW_cnt(dto.getW_cnt().substring(1));// ckeditor 의 첫 문자 ',' 제거
		//System.out.println("w_cnt2 : " + dto.getW_cnt());
		
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	@RequestMapping(value = "write_form", method = RequestMethod.GET)
	public String write_form(RoomDTO dto, String r_no , Model model) {
		
		dto.setR_no(r_no);
		model.addAttribute("dto", dto);
		return "/cnts/write_form";
	}//write_form
	
	@RequestMapping(value = "testlist", method = RequestMethod.GET)
	public String testlist(Model model, HttpSession session ) {
		
		
		List<CntsDTO> list = null;
		list = service.testlist();
		model.addAttribute("list", list);
		return "/cnts/testlist";
	}//testlist
}//class
