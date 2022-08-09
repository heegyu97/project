package kr.co.ictedu.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class MainDAO {

	@Autowired
	private SqlSession sqlSession;

	/*
	 * 핵심 메소드 목록 : searchList, searchListCount, update, delete, detail, write
	 */
	/*
	 * 연습 메소드 목록 : search1Test, pagingList, totalListCount, list
	 */

	public List<MainDTO> searchList( SearchDTO dto ) {
		List<MainDTO> list = null;
		list = sqlSession.selectList("FreeBoardMapper.searchList", dto);
		return list;
	}//searchList

	public int searchListCount( SearchDTO dto ) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("FreeBoardMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

	public List<MainDTO> search1Test( SearchDTO dto ) {
		List<MainDTO> list = null;
		list = sqlSession.selectList("FreeBoardMapper.search1Test", dto);
		return list;
	}//search1Test

	public List<MainDTO> pagingList( int limitNum ) {
		List<MainDTO> list = null;
		list = sqlSession.selectList("FreeBoardMapper.pagingList", limitNum);
		return list;
	}//pagingList

	public int totalListCount() {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("FreeBoardMapper.totalListCount");
		return totalCount;
	}//totalListCount

	public int update( MainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("FreeBoardMapper.update", dto);
		return successCount;
	}//update

	public int delete( MainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.delete("FreeBoardMapper.delete", dto);
		return successCount;
	}//delete

	public MainDTO detail( String board_no ) {
		MainDTO dto = null;
		dto = sqlSession.selectOne("FreeBoardMapper.detail", board_no);
		return dto;
	}//detail

	public void incrementViewCnt( String board_no ) {
		sqlSession.update("FreeBoardMapper.incrementViewCnt", board_no);
	}//incrementViewCnt

	public int write( MainDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("FreeBoardMapper.write", dto);
		return successCount;
	}//write

	public List<MainDTO> list() {
		List<MainDTO> list = null;
		list = sqlSession.selectList("FreeBoardMapper.list");
		return list;
	}//list

}//class
