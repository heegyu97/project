package kr.co.ictedu.main;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.ictedu.util.dto.RoomDTO;

@Service
public class SelectService {
	
	@Autowired
	private SelectDAO dao;

	public List<RoomDTO> list() {
		List<RoomDTO> list = null;
		list = dao.list();
		return list;
	}//list


}//class
