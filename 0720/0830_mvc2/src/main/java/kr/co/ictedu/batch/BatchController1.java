package kr.co.ictedu.batch;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//@Controller
public class BatchController1 {

	private final static Logger logger = LoggerFactory.getLogger(BatchController1.class);

	@Autowired
	private BatchService1 service;

	@Scheduled( cron = "15 56 14 * * *" )
	public void autoConfirm() {
		//삭제시킬정보 ( 방데이터 + 글데이터)
		//테이블 옮기기 ( 그날 삭제될 데이터 저장하기 방데이터만 복사 + 이전데이터삭제 )
		//기존 카피 테이블 삭제
		int successCount1 = 0;
		successCount1 = service.autoConfirmList();
		//카피 테이블 추가
		int successCount2 = 0;
		successCount2 = service.autoConfirmList2();
		
		//테이블 삭제 ( 그날 삭제될 데이터 삭제하기 방데이터 + 글데이터 )
		//방데이터 삭제
		int successCount3 = 0;
		successCount3 = service.autoConfirmList3();
		//글데이터 삭제
		int successCount4 = 0;
		successCount4 = service.autoConfirmList4();
	}//autoConfirm
	
	
}//class
