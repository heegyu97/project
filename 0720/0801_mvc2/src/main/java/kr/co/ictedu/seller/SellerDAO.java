package kr.co.ictedu.seller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.CommenCodeDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class SellerDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("SellerMapper.insert", dto);
		return successCount;
	}//insert
	
	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("SellerMapper.searchListCount", dto);
//		System.out.println(dto.getLimitNum());
//		System.out.println(totalCount);
		return totalCount;
	}//searchListCount

	public List<ProductDTO> searchList(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("SellerMapper.selectList", dto);
		return list;
	}//searchList

	public ProductDTO detail(String pro_no) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("SellerMapper.detail", pro_no);
		return dto;
	}//detail


	
	public int delete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("SellerMapper.delete", dto);
		return successCount;
	}//delete

	public int fileDelete(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("SellerMapper.fileDelete", dto);
		return successCount;
	}//fileDelete

	public int update(ProductDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("SellerMapper.update", dto);
		return successCount;
	}//update

	public List<CommenCodeDTO> bigSelect() {
		List<CommenCodeDTO> list = null;
		list = sqlSession.selectList("SellerMapper.bigSelect");
		return list;
	}//bigSelect

	public List<CommenCodeDTO> midSelect(String pro_big) {
		List<CommenCodeDTO> list = null;
		list = sqlSession.selectList("SellerMapper.midSelect", pro_big);
		return list;
	}

}//class
