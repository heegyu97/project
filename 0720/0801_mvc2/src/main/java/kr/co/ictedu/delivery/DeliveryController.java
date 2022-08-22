package kr.co.ictedu.delivery;

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

import kr.co.ictedu.util.dto.DeliveryDTO;
import kr.co.ictedu.util.dto.MemberDTO;



@Controller
@RequestMapping(value = "/delivery")
public class DeliveryController {
	
	private final static Logger logger = LoggerFactory.getLogger(DeliveryController.class);
	
	@Autowired
	private DeliveryService service;
	
	//모달 주소 삭제
	@RequestMapping( value = "/delete", method = RequestMethod.GET )
	public void delete( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete
	
	
	
	
	//주소 저장
	@RequestMapping( value = "/write", method = RequestMethod.POST )
	public void insert( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );

		int successCount = 0;
		successCount = service.write( dto );
		out.print(successCount);
		out.close();
	}//insert
	
	
	
	//주소등록창
	@RequestMapping(value = "/deliveryform", method = RequestMethod.GET)
	public String form( Model model, HttpSession session ) {
		List<DeliveryDTO> list = null;
		list = service.list( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
		model.addAttribute("list", list);
		
		return "delivery/form";
	}//form
	
	
}//class
