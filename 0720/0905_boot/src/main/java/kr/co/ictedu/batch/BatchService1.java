package kr.co.ictedu.batch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ictedu.order.OrderMainDTO;

@Service
public class BatchService1 {

	@Autowired
	private BatchDAO1 dao;

	public int updateAutoConfirm( List<OrderMainDTO> list ) {
		int successCount = 0;
		successCount = dao.updateAutoConfirm( list );
		return successCount;
	}//updateAutoConfirm

	public List<OrderMainDTO> autoConfirmList() {

		List<OrderMainDTO> list = null;
		list = dao.autoConfirmList();
		return list;

	}//autoConfirmList

}//class
