package kr.co.ictedu.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class MainService {

	@Autowired
	private MainDAO dao;

	/*
	 * 핵심 메소드 목록 : searchList, searchListCount, update, delete, detail, write
	 */
	/*
	 * 연습 메소드 목록 : search1Test, pagingList, totalListCount, list
	 */

	public List<MainDTO> searchList( SearchDTO dto ) {
		List<MainDTO> list = null;
		list = dao.searchList( dto );
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}//searchListCount

	public List<MainDTO> search1Test( SearchDTO dto ) {
		List<MainDTO> list = null;
		list = dao.search1Test( dto );
		return list;
	}//search1Test

	public List<MainDTO> pagingList( int limitNum ) {
		List<MainDTO> list = null;
		list = dao.pagingList( limitNum );
		return list;
	}//pagingList

	public int totalListCount() {
		int totalCount = 0;
		totalCount = dao.totalListCount();
		return totalCount;
	}//totalListCount

	public int update( MainDTO dto ) {
		int successCount = 0;
		successCount = dao.update( dto );
		return successCount;
	}//update

	public int delete( MainDTO dto ) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete

	public MainDTO detail( String board_no ) {
		dao.incrementViewCnt( board_no );
		MainDTO dto = null;
		dto = dao.detail( board_no );
		return dto;
	}//detail

	public int write( MainDTO dto ) {
		int successCount = 0;
		successCount = dao.write(dto);
		return successCount;
	}//write

	public List<MainDTO> list() {
		List<MainDTO> list = null;
		list = dao.list();
		return list;
	}//list

}//class







