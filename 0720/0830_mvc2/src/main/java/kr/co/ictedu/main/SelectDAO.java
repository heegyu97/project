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
	
		public List<RoomDTO> list(RoomDTO dto) {
			List<RoomDTO> list = null;
			list = sqlSession.selectList("SelectMapper.list",dto);
			return list;
		}//list

		public List<RoomDTO> searchList(RoomDTO dto) {
			List<RoomDTO> list = null;
			list = sqlSession.selectList("SelectMapper.searchList", dto);
			return list;
		}//searchList

		public int searchListCount(RoomDTO dto) {
			int totalCount = 0;
			totalCount = sqlSession.selectOne("SelectMapper.searchListCount",dto);
			return totalCount;
		}//searchListCount

	

	
		
		
}//class
