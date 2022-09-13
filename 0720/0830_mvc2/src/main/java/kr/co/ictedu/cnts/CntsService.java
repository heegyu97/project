package kr.co.ictedu.cnts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.CntsDTO;

@Service
public class CntsService {

	@Autowired
	private CntsDAO dao;
	
	public List<CntsDTO> testlist() {
		List<CntsDTO> list = null;
		list = dao.testlist();
		return list;
	}//testlist

	public int insert(CntsDTO dto) {
		int successCount = 0;
		successCount = dao.insert(dto);
		return successCount;
	}//insert

	public CntsDTO detail(String w_no) {
		CntsDTO dto = null;
		dto = dao.detail(w_no);
		return dto;
	}//detail

	public int delete(CntsDTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

}//class
