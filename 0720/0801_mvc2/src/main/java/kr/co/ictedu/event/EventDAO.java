package kr.co.ictedu.event;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.TipDTO;



@Repository
public class EventDAO{
	
	@Autowired
	private SqlSession sqlSession; 		
	
		public int insertevent(EventDTO dto) {
			int successCount = 0;
			System.out.println(dto);
			System.out.println("여가3");
			successCount = sqlSession.insert("EventMapper.insertevent", dto);
			System.out.println("여가4");
			System.out.println(successCount);
			return successCount;
		}//insertevent

		public List<EventDTO> event() {
			List <EventDTO> forwardEvnt = null;
			System.out.println("여가5");
			forwardEvnt = sqlSession.selectList("EventMapper.event");
			System.out.println(forwardEvnt);
			return forwardEvnt;
		}

		public int delete(String evnt_no) {
			int successCount;
			successCount = sqlSession.delete("EventMapper.delete",evnt_no);
			return successCount;
		}

		public int update(EventDTO dto) {
			int successCount =0;
			successCount=sqlSession.update("EventMapper.update",dto);
			
			return successCount;	
		}//update

		public EventDTO evntdetail(String evnt_no) {
			EventDTO dto = null;
			dto = sqlSession.selectOne("EventMapper.detail",evnt_no);
			
			return dto;
		}//evntdetail


}//class
