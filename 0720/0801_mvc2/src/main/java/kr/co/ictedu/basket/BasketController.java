package kr.co.ictedu.basket;

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

import kr.co.ictedu.util.dto.BasketDTO;
import kr.co.ictedu.util.dto.DeliveryDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;

@Controller
@RequestMapping(value = "/basket")
public class BasketController {
	
	private final static Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	@Autowired
	private BasketService service;
	
	
	
	//장바구니 삭제버튼
	@RequestMapping( value = "/basketdelete", method = RequestMethod.GET )
	public void basketDelete( BasketDTO dto, HttpSession session, PrintWriter out ) {
		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
	}//delete
	
	
	
	//수량변경
	@RequestMapping( value = "/updatebuyqty", method = RequestMethod.GET )
	public void updateBuyQty( BasketDTO dto, HttpSession session, PrintWriter out ) {
		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );

		int successCount = 0;
		
		logger.info(dto.getB_no()+"번호~~~~~~~~~~~~~");
		logger.info(dto.getB_stock()+"개수~~~~~~~~~~~~~");
		successCount = service.updatebuyqty( dto );
		out.print(successCount);
		out.close();
	}//updateBuyQty
	
	
	
	//장바구니 첫 화면 불러오기
	@RequestMapping(value = "/basketlist", method = RequestMethod.GET)
	public String basketList( Model model, HttpSession session, BasketDTO dto) {//, String pro_no넣어야함 뺴고 test진행함
		
		//String m_no = ( (MemberDTO) session.getAttribute("login_info") ).getM_no();//m_no값 하나만 보내고싶을떄 사용
		
		MemberDTO mDto = (MemberDTO) session.getAttribute("login_info");
		dto.setM_no(mDto.getM_no());
		
		List<BasketDTO> list = null;
		list = service.basketlist(dto);
		
		model.addAttribute("list", list);
		
		return "/basket/basketlist";
		
	}//basketList
	
	//list불러오기 test 삭제예정
//	@RequestMapping(value = "/basketlist", method = RequestMethod.GET)
//	public String basketList( Model model, HttpSession session, BasketDTO dto) {//, String pro_no넣어야함 뺴고 test진행함
//		
//		
//		List<BasketDTO> list = null;
//		list = service.list();//pro_no넣어야함 빼고 test진행함
//		
//		model.addAttribute("list", list);
//		
//		return "/basket/basketlist";
//		
//	}//basketList
	
	
	
	//상품detail화면에서 값을가져와 db저장후 저장완료int를 detail.jsp에 보냄
	@RequestMapping( value = "/basketinsert", method = RequestMethod.POST )
	public void basketInsert( ProductDTO dto, HttpSession session, PrintWriter out ) {
		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );//로그인 체크

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	
	
	
	
	
	
	
	
	
	
//	//배송지 start
//	
//	@RequestMapping( value = "/delivery/delete", method = RequestMethod.GET )
//	public void delete( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
//		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
//		
//		
//
//		int successCount = 0;
//		successCount = service.delete( dto );
//		out.print(successCount);
//		out.close();
//	}//delete
//
//	@RequestMapping( value = "/delivery/insert", method = RequestMethod.POST )
//	public void insert( DeliveryDTO dto, HttpSession session, PrintWriter out ) {
//		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
//
//		int successCount = 0;
//		successCount = service.insert( dto );
//		out.print(successCount);
//		out.close();
//	}//insert
//
//	@RequestMapping(value = "/delivery/form", method = RequestMethod.GET)
//	public String form( Model model, HttpSession session ) {
//		List<DeliveryDTO> list = null;
//		list = service.list( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
//		model.addAttribute("list", list);
//		return "delivery/form";
//	}//form
//	
//	
//	//배송지 end
	
	
}//class
