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
		System.out.println(dto);
		dtoFromDB = sqlSession.selectOne("LoginMapper.login", dto);
		System.out.println(dtoFromDB);
		return dtoFromDB;
	}//login

}//class