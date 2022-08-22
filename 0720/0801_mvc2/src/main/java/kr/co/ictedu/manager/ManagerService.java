package kr.co.ictedu.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerDAO dao;
	
	public int deleteid(MemberDTO dto) {
		int successCount = 0;
		successCount = dao.deleteid( dto );
		return successCount;
	}

	public int updateid(MemberDTO dto) {
		int successCount = 0;
		successCount = dao.updateid(dto);
		return successCount;
	}


	public int searchListCount(SearchDTO dto) {
		int totalCount = 0;
		totalCount = dao.searchListCount( dto );
		return totalCount;
	}

	public List<MemberDTO> searchList(SearchDTO dto) {
		List<MemberDTO> list = null;
		list = dao.searchList(dto);
		return list;
	}

	public MemberDTO searchMember(MemberDTO dto)  {
		MemberDTO list = null;
		list = dao.searchMember(dto);
		return list;
	}


	public int membermanagement_delete(String m_no) {
		int successCount = 0;
		successCount = dao.membermanagement_delete( m_no );
		return successCount;
	}



}//class
