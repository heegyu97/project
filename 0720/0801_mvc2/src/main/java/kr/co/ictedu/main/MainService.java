package kr.co.ictedu.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.event.EventDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class MainService {

	@Autowired
	private MainDAO dao;

	public int join( MemberDTO dto ) {
		int successCount = 0;
		
		if( dto.getM_tel1() != null && !dto.getM_tel1().equals("")
			&& dto.getM_tel2() != null && !dto.getM_tel2().equals("")
			&& dto.getM_tel3() != null && !dto.getM_tel3().equals("") ) {
			dto.setM_tel( dto.getM_tel1() + dto.getM_tel2() + dto.getM_tel3() );
		}
		if( dto.getM_email1() != null && !dto.getM_email1().equals("")
			&& dto.getM_email2() != null && !dto.getM_email2().equals("") ) {
			dto.setM_email( dto.getM_email1() + "@" + dto.getM_email2() );
		}
		
		
		if( dto.getM_h_tel1() != null && !dto.getM_h_tel1().equals("")
				&& dto.getM_h_tel2() != null && !dto.getM_h_tel2().equals("")
				&& dto.getM_h_tel3() != null && !dto.getM_h_tel3().equals("") ) {
			dto.setM_h_tel( dto.getM_h_tel1() + dto.getM_h_tel2() + dto.getM_h_tel3() );
		}

		
		if( dto.getM_h_email1() != null && !dto.getM_h_email1().equals("")
			&& dto.getM_h_email2() != null && !dto.getM_h_email2().equals("") ) {
			dto.setM_h_email( dto.getM_h_email1() + "@" + dto.getM_h_email2() );
		}
		
		
		successCount = dao.join(dto);
		return successCount;
	}//join
	
	
	public int idCheck( String mid ) {
		int isYN = 0;
		isYN = dao.idCheck( mid );
		return isYN;
	}//idCheck


	public List<EventDTO> event() {
		List <EventDTO> forwardEvnt = null;
		forwardEvnt = dao.event();
		return forwardEvnt;
	}





}//class







