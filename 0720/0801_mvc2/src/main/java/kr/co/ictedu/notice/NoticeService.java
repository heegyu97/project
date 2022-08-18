package kr.co.ictedu.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.NoticeDTO;
import kr.co.ictedu.util.dto.SearchDTO;
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


	public int write(NoticeDTO dto) {
		int successCount=0;
		successCount=dao.write(dto);
		
		return successCount;
	}//write


	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount


	public List<NoticeDTO> searchList(SearchDTO dto) {
		List<NoticeDTO>list =null;
		list = dao.searchList(dto);
		
		return list;
	}//searchList


	public NoticeDTO detail(String noti_no) {
		//조회수 카운트
			dao.incrementViewCnt( noti_no );
			
			NoticeDTO dto = null;
			dto = dao.detail(noti_no);
			
			return dto;
	}//detail


	public int fileDelete(NoticeDTO dto) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete

	
}//class
