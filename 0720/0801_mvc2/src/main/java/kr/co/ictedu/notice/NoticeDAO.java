package kr.co.ictedu.notice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.NoticeDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int update(NoticeDTO dto) {
		int successCount =0;
		successCount=sqlSession.update("NoticeMapper.update",dto);
		
		return successCount;	
	}//update
	
}//class
