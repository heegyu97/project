package kr.co.ictedu.main;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.ictedu.util.dto.RoomDTO;

@Service
public class SelectService {
	
	@Autowired
	private SelectDAO dao;

	public List<RoomDTO> list(RoomDTO dto) {
		List<RoomDTO> list = null;
		list = dao.list(dto);
		return list;
	}//list

	public int searchListCount(RoomDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount(dto);
		return totalCount;
	}//searchListCount

	public List<RoomDTO> list2(RoomDTO dto) {
		List<RoomDTO> list2 = null;
		list2 = dao.list2(dto);
		return list2;
	}

	
}//class