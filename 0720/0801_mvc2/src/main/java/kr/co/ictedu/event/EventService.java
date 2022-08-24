package kr.co.ictedu.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class EventService {
	
	@Autowired
	private EventDAO dao;
	
	public int insertevent(EventDTO dto) {
		int successCount = 0;
		System.out.println("여가2");
		successCount = dao.insertevent(dto);
		return successCount;
	}//insertevent

	public List<EventDTO> event() {
		List <EventDTO> forwardEvnt = null;
		forwardEvnt = dao.event();
		return forwardEvnt;
		
	}//List<EventDTO>


	
}//class