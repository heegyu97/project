package kr.co.ictedu.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.NoticeDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Service
public class NoticeService {

	
	@Autowired
	private NoticeDAO dao;
	
	
	public int update(NoticeDTO dto) {
		int successCount =0;
		successCount= dao.update(dto);
		
		return successCount;
	}//update
	
}//class
