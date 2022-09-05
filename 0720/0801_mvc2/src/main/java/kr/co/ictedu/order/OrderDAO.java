package kr.co.ictedu.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.OrderDTO;
import kr.co.ictedu.util.dto.ProductDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	
	public List<ProductDTO> orderlist(String[] arr_basket_no) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("OrderMapper.orderlist", arr_basket_no);
		return list;
	}//orderlist



	public int insertMain(OrderDTO dto) {
		int successCount = 0;
		successCount =sqlSession.insert("OrderMapper.insertMain", dto);
		return successCount;
	}

	public int deleteBasketByArray(String[] arr_basket_no) {
		int successCount = 0;
		successCount = sqlSession.delete("OrderMapper.deleteBasketByArray", arr_basket_no);
		return successCount;
	}


	public int insertdetail(OrderDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("OrderMapper.insertdetail", dto);
		return successCount;
	}


	public int insertDelivery(OrderDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("OrderMapper.insertDelivery", dto);
		return successCount;
	}




}//class
