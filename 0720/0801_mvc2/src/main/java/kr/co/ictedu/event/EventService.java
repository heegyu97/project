package kr.co.ictedu.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.TipDTO;



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

	public int delete(String evnt_no) {
		int successCount = 0;
		successCount = dao.delete(evnt_no);
		return successCount;
	}
	
	
	
	
	//희규
	public int update(EventDTO dto) {
		int successCount =0;
		successCount= dao.update(dto);
		
		return successCount;
	}//update

	public EventDTO evntdetail(String evnt_no) {
		EventDTO dto = null;
		dto = dao.evntdetail(evnt_no);
		
		return dto; 
	}//evntdetail


	
 }//class