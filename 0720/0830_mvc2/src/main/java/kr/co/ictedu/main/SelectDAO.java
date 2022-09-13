package kr.co.ictedu.main;



import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.co.ictedu.util.dto.RoomDTO;



@Repository
public class SelectDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
		public List<RoomDTO> list() {
			List<RoomDTO> list = null;
			list = sqlSession.selectList("SelectMapper.list");
			return list;
		}//list

	
		
		
}//class
