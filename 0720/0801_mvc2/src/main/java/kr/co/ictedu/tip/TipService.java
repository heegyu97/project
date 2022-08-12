package kr.co.ictedu.tip;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.TipDTO;

@Service
public class TipService {

	@Autowired
	private TipDAO dao;
	
	
	public int write(TipDTO dto) {
		int successCount=0;
		successCount=dao.write(dto);
		System.out.println(dto + "s");
		System.out.println(successCount);
		return successCount;
	}//write
	
	public int update(TipDTO dto) {
		int successCount =0;
		successCount= dao.update(dto);
		
		return successCount;
	}//update
	
}//class
