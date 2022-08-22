package kr.co.ictedu.manager;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession sqlSession;

	public int deleteid(MemberDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("ManagerMapper.deleteid", dto);
		return successCount;
	}

	public int updateid(MemberDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.update("ManagerMapper.updateid",dto);
		return successCount;
	}

	public List<MemberDTO> list() {
		List<MemberDTO> list = null;
		list = sqlSession.selectList("ManagerMapper.list");
		return list;
	}

	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = sqlSession.selectOne("ManagerMapper.searchListCount", dto);
		return totalCount;
	}

	public List<MemberDTO> searchList(SearchDTO dto) {
		List<MemberDTO> list = null;
		list = sqlSession.selectList("ManagerMapper.selectList", dto);
		return list;
	}

	public MemberDTO searchMember(MemberDTO dto) {
		MemberDTO list = null;
		list = sqlSession.selectOne("ManagerMapper.searchMember", dto);
		return list;
	}

	public int membermanagement_delete(String m_no) {
		int successCount = 0;
		successCount = sqlSession.delete("ManagerMapper.membermanagement_delete", m_no);
		return successCount;
	}

}//class
