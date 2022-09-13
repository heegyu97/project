package kr.co.ictedu.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;

@Service
public class LoginService {

	@Autowired
	private LoginDAO dao;

	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = dao.login( dto );
		return dtoFromDB;
	}//login

	public MemberDTO idCheck(String m_email) {
		MemberDTO dto = null;
		dto = dao.idCheck(m_email);
		return dto;
	}//idCheck : 간편 로그인 email 조사

	public int idCheck2( String m_id ) {
		int isYN = 0;
		isYN = dao.idCheck2( m_id );
		return isYN;
	}//idCheck2 : 아이디 중복 확인

	public int join( MemberDTO dto ) {
		int successCount = 0;
		
		successCount = dao.join(dto);
		return successCount;
	}//join : 회원가입버튼
	
}//class
