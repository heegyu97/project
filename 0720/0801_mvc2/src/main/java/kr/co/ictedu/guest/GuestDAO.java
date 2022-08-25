package kr.co.ictedu.guest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.HistoryDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class GuestDAO<CommenCodeDTO> {
	
	@Autowired
	private SqlSession sqlSession;

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("GuestMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

	public List<ProductDTO> searchList(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = sqlSession.selectList("GuestMapper.selectList", dto);
		return list;
	}//searchList

	public ProductDTO detail(String pro_no) {
		ProductDTO dto = null;
		dto = sqlSession.selectOne("GuestMapper.detail", pro_no);
		return dto;
	}//detail
	
	public void incrementViewCnt(String pro_no) {
		sqlSession.update("GuestMapper.incrementViewCnt", pro_no);
	}//incrementViewCnt

	public int deleteid(MemberDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("GuestMapper.deleteid", dto);
		return successCount;
	}

	public int updateid(MemberDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.update("GuestMapper.updateid", dto);
		System.out.println("=====" + successCount + "=====");
		return successCount;
	}
	
	public List<CommenCodeDTO> bigSelect( ) {
		List<CommenCodeDTO> list = null;
		list = sqlSession.selectList("GuestMapper.bigSelect");
		return list;
	}//bigSelect

	public List<CommenCodeDTO> midSelect(String select_pro_big) {
		List<CommenCodeDTO> list = null;
		System.out.println(select_pro_big);
		list = sqlSession.selectList("GuestMapper.midSelect", select_pro_big);
		return list;
	}


	public int searchordCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("GuestMapper.searchordCount",dto);
		return totalCount;
	}

	public List<HistoryDTO> ordList( SearchDTO dto) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("GuestMapper.ordList",dto);
		return list;
	}

	
	public List<HistoryDTO> paydetail(HistoryDTO dto) {
		List<HistoryDTO> list = null;
		list = sqlSession.selectList("GuestMapper.paydetail", dto);
		System.out.println(dto.getAddr_name()+"@@@@@@@@@@@@");
		return list;
	}//paydetail
}//class
