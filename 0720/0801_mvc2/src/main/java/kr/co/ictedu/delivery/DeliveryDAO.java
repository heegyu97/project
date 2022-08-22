package kr.co.ictedu.delivery;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ictedu.util.dto.DeliveryDTO;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<DeliveryDTO> list(String m_no) {
		List<DeliveryDTO> list = null;
		list = sqlSession.selectList("DeliveryMapper.list", m_no);
		return list;
	}//list

	public int write(DeliveryDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("DeliveryMapper.write", dto);
		return successCount;
	}//write

	public int delete(DeliveryDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("DeliveryMapper.delete", dto);
		//삭제 안시키고 db에 삭제여부 del_yn 이라는 칼럼을 넣어서 0이면 삭제안된 주소 1이면 삭제된주소로 구분해서 넣었음
		return successCount;
	}//delete



}//class
