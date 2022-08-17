package kr.co.ictedu.tip;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.SearchDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Repository
public class TipDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	
	public int fileDelete( TipDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.update("TipMapper.fileDelete", dto);
		return successCount;
	}//fileDelete
	
	
	
	
	
	public TipDTO tipdetail(String tip_no) {
		TipDTO dto = null;
		dto = sqlSession.selectOne("TipMapper.detail",tip_no);
		
		return dto;
	}//tipdetail
	
	
	
	public List<TipDTO> searchList(SearchDTO dto) {
		List<TipDTO>list = null;
		list= sqlSession.selectList("TipMapper.searchList",dto);
		
		return list;
	}//pagingList
	
	
	
	public int totalListCount( SearchDTO dto ) {
		int totalCount=0;
		System.out.println();
		totalCount = sqlSession.selectOne("TipMapper.totalListCount", dto);
		System.out.println(totalCount + "토탈카운트");
		
		return totalCount;
	}//totalListCount
	
	
	public List<TipDTO> list() {
		List<TipDTO> list = null;
		list = sqlSession.selectList("TipMapper.list");
		//System.out.println(list);
		return list;
	}//searchList
	
	
	
	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("TipMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount
	
	
	public int write(TipDTO dto) {
		int successCount=0;
		successCount= sqlSession.insert("TipMapper.write",dto);
		System.out.println(dto + "dao");
		System.out.println(successCount);
		return successCount;
	}//write
	
	
	public int update(TipDTO dto) {
		int successCount =0;
		successCount=sqlSession.update("TipMapper.update",dto);
		
		return successCount;	
	}//update
	
}//class
