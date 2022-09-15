package kr.co.ictedu.space;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.OptionDTO;
import kr.co.ictedu.util.dto.RoomDTO;
import kr.co.ictedu.util.dto.CntsDTO;

@Repository
public class SpaceDAO {

	@Autowired
	private SqlSession sqlSession;

	public int roomlistCount(String r_no) {
      int totalcount = 0;
      totalcount = sqlSession.selectOne("SpaceMapper.roomlistCount",r_no);
      return totalcount;
	}
	
	public RoomDTO roomlist(String r_no) {
		RoomDTO dto = null;
		dto = sqlSession.selectOne("SpaceMapper.roomlist", r_no);
		return dto;
	}
	public List<CntsDTO> list(String r_no) {
		List<CntsDTO> list =null;
		list= sqlSession.selectList("SpaceMapper.list",r_no);
		
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
