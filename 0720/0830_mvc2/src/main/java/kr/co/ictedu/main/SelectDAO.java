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

		
		public int searchListCount(RoomDTO dto) {
			int totalCount = 0;
			totalCount = sqlSession.selectOne("SelectMapper.searchListCount",dto);
			return totalCount;
		}//searchListCount


		public List<RoomDTO> list2(RoomDTO dto) {
			List<RoomDTO> list2 = null;
			list2 = sqlSession.selectList("SelectMapper.list2",dto);
			return list2;
		}

		
}//class
