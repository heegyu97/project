package kr.co.ictedu.guest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class GuestService {
	
	@Autowired
	private GuestDAO dao;

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

	public List<ProductDTO> searchList(SearchDTO dto) {
		List<ProductDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public ProductDTO detail(String pro_no) {
		dao.incrementViewCnt( pro_no );
		
		ProductDTO dto = null;
		dto = dao.detail( pro_no );
		return dto;
	}


	public int deleteid(MemberDTO dto) {
		int successCount = 0;
		successCount = dao.deleteid( dto );
		return successCount;
	}

	public int updateid(MemberDTO dto) {
		int successCount;
		successCount = dao.updateid(dto);
		return successCount;
	}
	
}//class
