package kr.co.ictedu.login;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;

	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = sqlSession.selectOne("LoginMapper.login", dto);
		return dtoFromDB;
	}//login

	public MemberDTO idCheck(String m_email) {
		MemberDTO dto = null;
		dto = sqlSession.selectOne("LoginMapper.idCheck", m_email);
		return dto;
	}//idcheck : 간편로그인

	public int idCheck2( String m_id ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("LoginMapper.idCheck2", m_id);
		return isYN;
	}//idCheck2 : 아이디 중복 확인
	
	public int join( MemberDTO dto ) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.insert("LoginMapper.join", dto);
		System.out.println(successCount + "========================================");
		return successCount;
	}//join
}//class
