package kr.co.ictedu.basket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.BasketDTO;
import kr.co.ictedu.util.dto.ProductDTO;

@Service
public class BasketService {

	@Autowired
	private BasketDAO dao;
	public List<ProductDTO> list() {// String pro_no넣어야함 뺴고 test진행함
		List<ProductDTO> list = null;
		list = dao.list();
		return list;
	}//list

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
	
	
}//class
