package kr.co.ictedu.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.BasketDTO;
import kr.co.ictedu.util.dto.DeliveryDTO;
import kr.co.ictedu.util.dto.ProductDTO;

@Service
public class BasketService {

	@Autowired
	private BasketDAO dao;
	
	
	public List<BasketDTO> basketlist( BasketDTO dto) {
		List<BasketDTO> list = null;
		list = dao.basketlist(dto);
		return list;
	}//list
	
	//list불러오기 test 삭제예정
//	public List<BasketDTO> list() {// String pro_no넣어야함 뺴고 test진행함
//		List<BasketDTO> list = null;
//		list = dao.list();
//		return list;
//	}//list

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

	public int updatebuyqty(BasketDTO dto) {
		int successCount = 0;
		successCount = dao.updatebuyqty( dto );
		return successCount;
	}//updatebuyqty

	public int delete(BasketDTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete
	
	
	
//	//배송지 start
//	public int delete( DeliveryDTO dto ) {
//		int successCount = 0;
//		successCount = dao.delete( dto );
//		return successCount;
//	}//delete
//
//	public int insert( DeliveryDTO dto ) {
//		int successCount = 0;
//		successCount = dao.insert( dto );
//		return successCount;
//	}//write
//
//	public List<DeliveryDTO> list( String m_no ) {
//		List<DeliveryDTO> list = null;
//		list = dao.list( m_no );
//		return list;
//	}//list
//	//배송지 end
	
	
	
	
	
}//class
