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

	public List<ProductDTO> list() {//, String pro_no넣어야함 뺴고 test진행함
		List<ProductDTO> list = null;
		list = sqlSession.selectList("BasketMapper.list");
		return list;
	}//list

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("BasketMapper.insert", dto);
		return successCount;
	}//insert

	public int updatebuyqty(BasketDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("BasketMapper.updatebuyqty", dto);
		return successCount;
	}//updatebuyqty

	public int delete(BasketDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("BasketMapper.delete", dto);
		return successCount;
	}//delete

}//class
