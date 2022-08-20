package kr.co.ictedu.event;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class EventDAO{
	
	@Autowired
	private SqlSession sqlSession; 		
	


}//class
