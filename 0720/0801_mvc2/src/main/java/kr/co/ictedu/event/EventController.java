package kr.co.ictedu.event;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class EventController {

	@Autowired
	private EventService service;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class); 
	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event() {
		return "/event/event";//jsp 파일 이름
	
	}//main
	
	@RequestMapping(value = "/event/eventdetail_tip", method = RequestMethod.GET)
	public String eventdetail_tip() {
		
		return "/event/eventdetail_tip";//jsp 파일 이름
		
	}//eventdetail_tip
	
	@RequestMapping(value = "/event/eventdetail_sus", method = RequestMethod.GET)
	public String eventdetail_sus() {
		return "/event/eventdetail_sus";//jsp 파일 이름
		
	}//eventdetail_sus
	
	@RequestMapping(value = "/event/eventdetail_point", method = RequestMethod.GET)
	public String eventdetail_point() {
		return "/event/eventdetail_point";//jsp 파일 이름
		
	}//eventdetail_point
	
	@RequestMapping(value = "/event/event_seller", method = RequestMethod.GET)
	public String event_seller() {
		return "/event/event_seller";//jsp 파일 이름
		
	}//event_seller
	@RequestMapping(value = "/event/event_manager", method = RequestMethod.GET)
	public String event_admin() {
		return "/event/event_manager";//jsp 파일 이름
		
	}//event_admin
	
	@RequestMapping(value = "/event/event_form", method = RequestMethod.GET)
	public String event_form() {
		return "/event/event_form";//jsp 파일 이름
		
	}//event_form
	
	//===================지우씨꺼=========================================

	@RequestMapping(value = "/event/insertevent", method = RequestMethod.POST)
	public void insertevent(EventDTO dto , PrintWriter out) throws IOException{
		
		
		File newFolder = new File("C:/upload/test/");
		if(newFolder.exists()==false) newFolder.mkdirs();
		
		MultipartFile file = dto.getUpload_file();
		InputStream is = file.getInputStream();
		
		
		FileOutputStream fos = new FileOutputStream("C:/upload/test/" + file.getOriginalFilename());
		
		
			
			FileCopyUtils.copy(is,fos);
			is.close();
			fos.close();
			
			
			dto.setEvnt_pic(file.getOriginalFilename());
			dto.setEvnt_pic_path("/upload/product" + "/" + file.getOriginalFilename() );
			dto.setEvnt_thum_name( file.getOriginalFilename());
			dto.setEvnt_thum_path("/upload/test/" + file.getOriginalFilename());
			
		
			
			//public void setEvnt_thum_file(MultipartFile evnt_thum_file)
			//public void setEvnt_thum_path(String evnt_thum_path)
			
		
		logger.info(dto.getEvnt_no());
		logger.info(dto.getEvnt_title());
		logger.info(dto.getEvnt_strt());
		logger.info(dto.getEvnt_end());
		logger.info(dto.getEvnt_ctnts());
		logger.info(dto.getEvnt_pic());
		logger.info(dto.getEvnt_pic_path());
		logger.info(dto.getEvnt_thum_name());
		logger.info(dto.getEvnt_thum_path());
		int successCount = 0; 
		successCount = service.insertevent(dto);
		out.print(successCount);
		out.close();
		
		
		
		
		
		/*
		int successCount = 0;
		successCount = service.insertevent(dto);
		out.print(successCount);
		out.close();
		*/
	}//insertevent
	
}//class
