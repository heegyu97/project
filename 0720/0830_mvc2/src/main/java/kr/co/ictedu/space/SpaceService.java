package kr.co.ictedu.space;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.OptionDTO;
import kr.co.ictedu.util.dto.RoomDTO;
import kr.co.ictedu.util.dto.CntsDTO;

@Service
public class SpaceService {

	@Autowired
	private SpaceDAO dao;

	public RoomDTO roomlist(String r_no) {
		RoomDTO dto = null;
		dto = dao.roomlist(r_no);
		return dto;
	}
	public List<CntsDTO> list(String r_no) {
		List<CntsDTO> list = null;
		list=dao.list(r_no);
		
		
		return list;
	}//list

	public int insert(RoomDTO dto) {
		int successCount = 0;
		successCount= dao.insert(dto);
		
		return successCount;
	}//insert

	public List<OptionDTO> oplist(String r_op1) {
		 List<OptionDTO> list = null;
		 list = dao.oplist(r_op1);
		return list;
	}//oplist

	
	
}//class
