package kr.co.ictedu.tip;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.TipDTO;

@Repository
public class TipDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public int write(TipDTO dto) {
		int successCount=0;
		successCount= sqlSession.insert("TipMapper.write",dto);
		return successCount;
	}//write
	
	
	public int update(TipDTO dto) {
		int successCount =0;
		successCount=sqlSession.update("TipMapper.update",dto);
		
		return successCount;	
	}//update
	
}//class
