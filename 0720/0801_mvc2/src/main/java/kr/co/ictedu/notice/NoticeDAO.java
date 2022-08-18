package kr.co.ictedu.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.NoticeDTO;
import kr.co.ictedu.util.dto.SearchDTO;
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

	public int write(NoticeDTO dto) {
		int successCount=0;
		successCount= sqlSession.insert("NoticeMapper.write",dto);
		return successCount;
	}

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("NoticeMapper.searchListCount", dto);
		return totalCount;
	}//searchListCount

	public List<NoticeDTO> searchList(SearchDTO dto) {
		List<NoticeDTO>list = null;
		list= sqlSession.selectList("NoticeMapper.searchList",dto);
		
		return list;
	}//searchList

	public NoticeDTO detail(String noti_no) {
		
		NoticeDTO dto = null;
		dto = sqlSession.selectOne("NoticeMapper.detail",noti_no);
		
		return dto;
	}//detail
	
	
	//조회수 카운트
	public void incrementViewCnt(String noti_no) {
		sqlSession.update("NoticeMapper.incrementViewCnt",noti_no);
	}//incrementViewCnt

	
	
	public int fileDelete(NoticeDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("NoticeMapper.fileDelete", dto);
		return successCount;
	}//fileDelete

	public int delete(String noti_no) {
		int successCount = 0;
		successCount = sqlSession.delete("NoticeMapper.delete",noti_no);
		return successCount;
	}//delete

	

	
}//class
