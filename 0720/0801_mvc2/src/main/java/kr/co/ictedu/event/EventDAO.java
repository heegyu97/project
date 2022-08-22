package kr.co.ictedu.event;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class EventDAO{
	
	@Autowired
	private SqlSession sqlSession; 		
	
		public int insertevent(EventDTO dto) {
			int successCount = 0;
			successCount = sqlSession.insert("EventMapper.insertevent", dto);
			return successCount;
		}//insertevent


}//class
