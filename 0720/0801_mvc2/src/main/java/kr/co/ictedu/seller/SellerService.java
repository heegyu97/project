package kr.co.ictedu.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.CommenCodeDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class SellerService {
	
	@Autowired
	private SellerDAO dao;

	public int insert(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

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
		ProductDTO dto = null;
		dto = dao.detail( pro_no );
		return dto;
	}//detail

	public int delete(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public int fileDelete(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete

	public int update(ProductDTO dto) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

	public List<CommenCodeDTO> bigSelect() {
		List<CommenCodeDTO> list = null;
		list = dao.bigSelect();
		return list;
	}//bigSelect

	public List<CommenCodeDTO> midSelect(String select_pro_big) {
		List<CommenCodeDTO> list = null;
		list = dao.midSelect(select_pro_big);
		return list;
	}

//	public List<CommenCodeDTO> midSelect(CommenCodeDTO cDTO) {
//		List<CommenCodeDTO> proMidList = null;
//		proMidList = dao.midSelect(cDTO);
//		return proMidList;
//	}

	
	
}//class
