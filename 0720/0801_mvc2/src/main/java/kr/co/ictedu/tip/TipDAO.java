package kr.co.ictedu.tip;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.SearchDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Repository
public class TipDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<TipDTO> searchList( SearchDTO dto ) {
		List<TipDTO> list = null;
		list = sqlSession.selectList("TipMapper.selectList", dto);
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
