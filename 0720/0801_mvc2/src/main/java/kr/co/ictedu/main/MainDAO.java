package kr.co.ictedu.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class MainDAO {

	@Autowired
	private SqlSession sqlSession;

	public int idCheck( String mid ) {
		int isYN = 0;
		isYN = sqlSession.selectOne("MainMapper.idCheck", mid);
		return isYN;
	}//idCheck

	public int join( MemberDTO dto ) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.insert("MainMapper.join", dto);
		System.out.println(successCount + "========================================");
		return successCount;
	}//join



}//class
