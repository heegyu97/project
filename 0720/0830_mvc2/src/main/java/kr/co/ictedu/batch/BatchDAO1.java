package kr.co.ictedu.batch;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BatchDAO1 {

	@Autowired
	private SqlSession sqlSession;

	public int autoConfirmList() {
		int successCount1 = 0;
		successCount1 = sqlSession.delete("Batch1Mapper.autoConfirmList");
		return successCount1;
	}

	public int autoConfirmList2() {
		int successCount2 = 0;
		successCount2 = sqlSession.insert("Batch1Mapper.autoConfirmList2");
		return successCount2;
	}

	public int autoConfirmList3() {
		int successCount3 = 0;
		successCount3 = sqlSession.delete("Batch1Mapper.autoConfirmList3");
		return successCount3;
	}

	public int autoConfirmList4() {
		int successCount4 = 0;
		successCount4 = sqlSession.delete("Batch1Mapper.autoConfirmList4");
		return successCount4;
	}


}//class












