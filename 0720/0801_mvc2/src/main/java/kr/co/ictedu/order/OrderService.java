package kr.co.ictedu.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.OrderDTO;
import kr.co.ictedu.util.dto.ProductDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO dao;
	
	
	public List<ProductDTO> orderlist(String[] arr_basket_no) {
		List<ProductDTO> list = null;
		list = dao.orderlist(arr_basket_no);
		return list;
	}//orderlist


	public int insert(OrderDTO dto) {
		int successCount = 0;
		successCount = dao.insertMain(dto); //메인 
		//if(successCount < 1) return successCount;
		
		successCount = dao.insertdetail(dto);
		//if(successCount < 1) return successCount;
		
		successCount = dao.insertDelivery(dto);
		successCount = dao.deleteBasketByArray(dto.getArr_basket_no());
		//if(successCount < 1) return successCount;
		
		return successCount;
	}

}//class
