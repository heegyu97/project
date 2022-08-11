package kr.co.ictedu.notice;

import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.NoticeDTO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

	private final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/noticeupdate", method = RequestMethod.POST)
	public void noticeUpdate(NoticeDTO dto, PrintWriter out) {
		int successCount=0;
		
		successCount = service.update(dto);
		out.print(successCount);
		out.close();
	}//noticeUpdate
	
	
	@RequestMapping(value = "/noticeupdateform", method = RequestMethod.GET)
	public String noticeUpdateForm() {
		return"/notice/noticeupdateform";
	}//noticeUpdateForm
	
	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
	public String  noticeDetail() {
		
		return"/notice/noticedetail";
	}//noticeDetail
	
	@RequestMapping(value = "/noticewriteform", method = RequestMethod.GET)
	public String noticeWriteForm() {
		
		return"/notice/noticewriteform";
	}//noticeWriteForm
	
	
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice() {
		
		return"/notice/notice";
	}//notice
	
	
	
}//class
