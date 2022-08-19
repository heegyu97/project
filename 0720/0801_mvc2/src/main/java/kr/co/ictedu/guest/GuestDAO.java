package kr.co.ictedu.guest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class GuestDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("GusetMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

	public List<ProductDTO> searchList(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("GusetMapper.selectList", dto);
		return list;
	}//searchList

	public ProductDTO detail(String pro_no) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("GusetMapper.detail", pro_no);
		return dto;
	}//detail
	
	public void incrementViewCnt(String pro_no) {
		sqlSession.update("GusetMapper.incrementViewCnt", pro_no);
	}//incrementViewCnt
	
}//class
