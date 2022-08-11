package kr.co.ictedu.guest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuestDAO {
	
	@Autowired
	private SqlSession sqlSession;
}//class
