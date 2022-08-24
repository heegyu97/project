package kr.co.ictedu.seller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.CommenCodeDTO;
import kr.co.ictedu.util.dto.MemberDTO;
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
	/*
	public List<CommenCodeDTO> midSelect(String code_name) {
		List<CommenCodeDTO> list = null;
		list = sqlSession.selectList("SellerMapper.midSelect", code_name);
		return list;
	}
	*/

	public List<CommenCodeDTO> bigSelect( ) {
		List<CommenCodeDTO> list = null;
		list = sqlSession.selectList("SellerMapper.bigSelect");
		return list;
	}//bigSelect

	public List<CommenCodeDTO> midSelect(String select_pro_big) {
		List<CommenCodeDTO> list = null;
		System.out.println(select_pro_big);
		list = sqlSession.selectList("SellerMapper.midSelect1", select_pro_big);
		return list;
	}

//	public List<CommenCodeDTO> midSelect(CommenCodeDTO cDTO) {
//		List<CommenCodeDTO> list = null;
//		list = sqlSession.selectList("SellerMapper.midSelect1", cDTO);
//		return list;
//	}
	
	
	public int deleteid(MemberDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("SellerMapper.deleteid", dto);
		return successCount;
	}

	public int updateid(MemberDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.update("SellerMapper.updateid", dto);
		System.out.println("=====" + successCount + "=====");
		return successCount;
	}
	
	//제품정보 가져오기
	public List<ProductDTO> orderProSelect() {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("SellerMapper.orderProSelect"); 
		return list;
	}//orderSelect

	public ProductDTO proSelect(String select_pro_name) {
		ProductDTO proList = null;
		proList = sqlSession.selectOne("SellerMapper.proSelect",select_pro_name); 
		System.out.println(proList);
		return proList;
	}

	

	
	
}//class
