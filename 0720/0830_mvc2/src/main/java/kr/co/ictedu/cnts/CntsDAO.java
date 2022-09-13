package kr.co.ictedu.cnts;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.CntsDTO;

@Repository
public class CntsDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<CntsDTO> testlist() {
		List<CntsDTO> list = null;
		list = sqlsession.selectList("CntsMapper.testlist");
		return list;
	}

	public int insert(CntsDTO dto) {
		int successCount = 0;
		successCount = sqlsession.insert("CntsMapper.insert", dto);
		return successCount;
	}//insert

	public CntsDTO detail(String w_no) {
		CntsDTO dto = null;
		dto = sqlsession.selectOne("CntsMapper.detail", w_no);
		return dto;
	}

	public int delete(CntsDTO dto) {
		int successCount = 0;
		successCount = sqlsession.delete("CntsMapper.delete", dto);
		return successCount;
	}

}//class
