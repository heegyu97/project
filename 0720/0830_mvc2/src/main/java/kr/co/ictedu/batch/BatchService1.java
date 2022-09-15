package kr.co.ictedu.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BatchService1 {

	@Autowired
	private BatchDAO1 dao;

	public int autoConfirmList() {
		int successCount1 = 0;
		successCount1 = dao.autoConfirmList();
		return successCount1;
	}

	public int autoConfirmList2() {
		int successCount2 = 0;
		successCount2 = dao.autoConfirmList2();
		return successCount2;
	}

	public int autoConfirmList3() {
		int successCount3 = 0;
		successCount3 = dao.autoConfirmList3();
		return successCount3;
	}

	public int autoConfirmList4() {
		int successCount4 = 0;
		successCount4 = dao.autoConfirmList4();
		return successCount4;
	}


}//class
