package kr.co.ictedu.order;

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

import kr.co.ictedu.delivery.DeliveryService;
import kr.co.ictedu.util.dto.DeliveryDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.OrderDTO;
import kr.co.ictedu.util.dto.ProductDTO;


@Controller
@RequestMapping("/order")
public class OrderController {

	private final static Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	
	@Autowired
	private OrderService service;
	
	@Autowired
	private DeliveryService delservice;
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( OrderDTO dto, HttpSession session, PrintWriter out ) {
		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );

		String [] tmpArr = dto.getStr_basket_no().split(",");
		dto.setArr_basket_no(tmpArr);

		int successCount = 0;
		
		successCount = service.insert(dto);//장바구니를 통해
		System.out.println("getOrd_no :"+ dto.getOrd_no());
		logger.info(dto.toString());
		out.print(successCount);
		out.close();
	}//insert
	
	
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderlist(String [] arr_basket_no,Model model, HttpSession session) {
		List<ProductDTO> list = null;
		list  =service.orderlist(arr_basket_no);
		model.addAttribute("list", list);
			
		List<DeliveryDTO> deliverylist = null;
		deliverylist = delservice.list( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
		model.addAttribute("deliverylist", deliverylist);
		
		model.addAttribute( "arr_basket_no", new Gson().toJson( arr_basket_no ) );
		
		
		return"/order/orderlist";
	}//orderlist
	
	
}//class
