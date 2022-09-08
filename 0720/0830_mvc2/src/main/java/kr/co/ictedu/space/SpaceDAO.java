package kr.co.ictedu.space;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.OptionDTO;
import kr.co.ictedu.util.dto.RoomDTO;
import kr.co.ictedu.util.dto.SpaceDTO;

@Repository
public class SpaceDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<SpaceDTO> list() {
		List<SpaceDTO> list =null;
		list= sqlSession.selectList("SpaceMapper.list");
		
		return list;
	}//list

	public int insert(RoomDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("SpaceMapper.insert",dto);
		
		return successCount;
	}//insert

	public List<OptionDTO> oplist(String r_op1) {
		 List<OptionDTO> list = null;
		 list = sqlSession.selectList("SpaceMapper.oplist", r_op1);
		return list;
		
	}
	
}//class
