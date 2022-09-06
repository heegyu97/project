package kr.co.ictedu.space;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.SpaceDTO;

@Service
public class SpaceService {

	@Autowired
	private SpaceDAO dao;

	public List<SpaceDTO> list() {
		List<SpaceDTO>list=null;
		list=dao.list();
		
		
		return list;
	}//list
	
	
}//class
