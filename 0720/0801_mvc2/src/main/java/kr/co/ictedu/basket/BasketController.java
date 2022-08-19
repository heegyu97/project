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
		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.updatebuyqty( dto );
		out.print(successCount);
		out.close();
	}//updateBuyQty
	
	
	
	//장바구니 첫 화면 불러오기
	@RequestMapping(value = "/basketlist", method = RequestMethod.GET)
	public String basketList( Model model, HttpSession session, String pro_no) {
		
		//String mno = ( (MemberDTO) session.getAttribute("login_info") ).getMno();//로그인정보
		
		List<ProductDTO> list = null;
		list = service.list( pro_no );
		
		model.addAttribute("list", list);
		
		return "/basket/basketlist";
		
	}//basketList
	
	
	
	//상품detail화면에서 값을가져와 db저장후 저장완료int를 detail.jsp에 보냄
	@RequestMapping( value = "/basketinsert", method = RequestMethod.POST )
	public void basketInsert( ProductDTO dto, HttpSession session, PrintWriter out ) {
		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );//로그인 체크

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	
	
}//class
