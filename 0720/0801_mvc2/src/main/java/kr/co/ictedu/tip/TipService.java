package kr.co.ictedu.tip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.TipDTO;

@Service
public class TipService {

	@Autowired
	private TipDAO dao;
	
	

	public int delete(TipDTO dto) {
		int successCount=0;
		successCount = dao.delete(dto);
		return successCount;
	}//delete

	

	public int write(TipDTO dto) {
		int successCount=0;
		successCount=dao.write(dto);
		
		return successCount;
	}//write
	
	public int update(TipDTO dto) {
		int successCount =0;
		successCount= dao.update(dto);
		
		return successCount;
	}//update
	
}//class
