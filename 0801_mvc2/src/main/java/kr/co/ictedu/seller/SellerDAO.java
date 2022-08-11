package kr.co.ictedu.seller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerDAO {
	
	@Autowired
	private SqlSession sqlSession;
}//class
