package kr.co.ictedu.guest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class GuestDAO<CommenCodeDTO> {
	
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

	public int deleteid(MemberDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("GusetMapper.deleteid", dto);
		return successCount;
	}

	public int updateid(MemberDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.update("GusetMapper.updateid", dto);
		System.out.println("=====" + successCount + "=====");
		return successCount;
	}
	
	public List<CommenCodeDTO> bigSelect( ) {
		List<CommenCodeDTO> list = null;
		list = sqlSession.selectList("GusetMapper.bigSelect");
		return list;
	}//bigSelect

	public List<CommenCodeDTO> midSelect(String select_pro_big) {
		List<CommenCodeDTO> list = null;
		System.out.println(select_pro_big);
		list = sqlSession.selectList("GusetMapper.midSelect", select_pro_big);
		return list;
	}
}//class
