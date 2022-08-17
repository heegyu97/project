package kr.co.ictedu.tip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.SearchDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Service
public class TipService {

	@Autowired
	private TipDAO dao;
	
	
	public int fileDelete( TipDTO dto ) {
		int successCount = 0;
		successCount = dao.fileDelete( dto );
		return successCount;
	}//fileDelete
	
	
	
	
	public TipDTO tipdetail(String tip_no) {
		TipDTO dto = null;
		dto = dao.tipdetail(tip_no);
		
		return dto; 
	}//tipdetail
	
	
	
	public List<TipDTO> list( ) {
		List<TipDTO> list = null;
		list = dao.list();
		return list;
	}//searchList
	
	
	
	public List<TipDTO> searchList( SearchDTO dto) {
		List<TipDTO>list =null;
		list = dao.searchList(dto);
		
		return list;
	}//pagingList
	
	
	
	public int totalListCount(SearchDTO dto) {
		int totalCount =0;
		totalCount =dao.totalListCount( dto );
		
		return totalCount;
	}//totalListCount
	
	
	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount
	
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
