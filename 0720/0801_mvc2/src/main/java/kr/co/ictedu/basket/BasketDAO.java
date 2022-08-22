package kr.co.ictedu.basket;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.BasketDTO;
import kr.co.ictedu.util.dto.ProductDTO;

@Repository
public class BasketDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProductDTO> basketlist(String m_no ) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("BasketMapper.basketlist",m_no);
		return list;
	}//list
	
	//list불러오기 test 삭제예정
//	public List<BasketDTO> list() {//, String pro_no넣어야함 뺴고 test진행함
//		List<BasketDTO> list = null;
//		list = sqlSession.selectList("BasketMapper.list");
//		return list;
//	}//list

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BasketMapper.insert", dto);
		return successCount;
	}//insert

	public int updatebuyqty(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("BasketMapper.updatebuyqty", dto);
		return successCount;
	}//updatebuyqty

	public int delete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("BasketMapper.delete", dto);
		return successCount;
	}//delete
	
	
	
//	//배송지 start
//	public int delete( DeliveryDTO dto ) {
//		int successCount = 0;
//		successCount = sqlSession.update("DeliveryMapper.delete", dto);
//		return successCount;
//	}//delete
//
//	public int insert( DeliveryDTO dto) {
//		int successCount = 0;
//		successCount = sqlSession.insert("DeliveryMapper.insert", dto);
//		return successCount;
//	}//insert
//
//	public List<DeliveryDTO> list( String m_no ) {
//		List<DeliveryDTO> list = null;
//		list = sqlSession.selectList("DeliveryMapper.list", m_no);
//		return list;
//	}//list
//	//배송지 end
	
	

}//class
