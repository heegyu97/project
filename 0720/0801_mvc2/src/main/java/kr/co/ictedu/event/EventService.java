package kr.co.ictedu.event;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class EventService {
	
	@Autowired
	private EventDAO dao;
	
	public int insertevent(EventDTO dto) {
		int successCount = 0;
		successCount = dao.insertevent(dto);
		return successCount;
	}//insertevent


	
}//class