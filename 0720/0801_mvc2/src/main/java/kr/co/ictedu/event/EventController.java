package kr.co.ictedu.event;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.TipDTO;


@Controller
public class EventController {

	@Autowired
	private EventService service;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class); 
	@RequestMapping(value = "/event/delete", method = RequestMethod.GET )
	public void delete(PrintWriter out,String evnt_no) {
		int successCount = 0;
		successCount = service.delete(evnt_no);
		
		out.print(successCount);
		out.close();
	
	}//main
	
	@RequestMapping(value = "/event", method = RequestMethod.GET )
	public String event(Model model) {
		List <EventDTO> forwardEvnt = null;
		forwardEvnt = service.event();
		model.addAttribute("forwardEvnt", forwardEvnt);
		
		return "/event/event";//jsp 파일 이름
	
	}//main

	//희규
	@RequestMapping(value = "/event/eventdetail_sus", method = RequestMethod.GET)
	public String eventdetail_sus(EventDTO dto, Model model) {
		
		model.addAttribute("evnt", dto);
		
		return "/event/eventdetail_sus";//jsp 파일 이름
		
	}//eventdetail_sus


	@RequestMapping(value = "/event/event_form", method = RequestMethod.GET)
	public String event_form() {
		return "/event/event_form";//jsp 파일 이름
		
	}//event_form
	
	//===================지우씨꺼=========================================

	@RequestMapping(value = "/event/insertevent", method = RequestMethod.POST)
	public void insertevent(EventDTO dto , PrintWriter out) throws IOException{

		File newFolder = new File("C:/upload/test/");
		if(newFolder.exists()==false) newFolder.mkdirs();

		MultipartFile file = dto.getEvnt_thum_file();
		InputStream is = file.getInputStream();
		FileOutputStream fos = new FileOutputStream("C:/upload/test/" + file.getOriginalFilename());
			
		FileCopyUtils.copy(is,fos);
		is.close();
		fos.close();
		
		dto.setEvnt_thum_name( file.getOriginalFilename());
		dto.setEvnt_thum_path("/upload/test/" + file.getOriginalFilename());

		MultipartFile file2 = dto.getEvnt_pic_file();
		if(!file2.isEmpty()) {
			InputStream is2 = file2.getInputStream();
			FileOutputStream fos2 = new FileOutputStream("C:/upload/test/" + file2.getOriginalFilename());
	
			FileCopyUtils.copy(is2,fos2);
			is2.close();
			fos2.close();

			dto.setEvnt_pic_name(file2.getOriginalFilename());
			dto.setEvnt_pic_path("/upload/product" + "/" + file2.getOriginalFilename() );
		}
		
			logger.info(dto.getEvnt_no());
			logger.info(dto.getEvnt_title());
			logger.info(dto.getEvnt_strt());
			logger.info(dto.getEvnt_end());
			logger.info(dto.getEvnt_ctnts());
			logger.info(dto.getEvnt_pic_name());
			logger.info(dto.getEvnt_pic_path());
			logger.info(dto.getEvnt_thum_name());
			logger.info(dto.getEvnt_thum_path());
			
		int successCount = 0; 
		System.out.println("여가1");
		System.out.println(dto);
		successCount = service.insertevent(dto);
		
		out.print(successCount);
		
		out.close();

	}//insertevent
	
	
	//희규
	@RequestMapping(value = "/event/event_uform/",method = RequestMethod.GET)
	public String eventUform( String evnt_no, Model model, HttpSession session) {
		
		MemberDTO mDto = (MemberDTO)session.getAttribute("login_info");
				
			EventDTO dto = null;
			dto = service.evntdetail(evnt_no);
			model.addAttribute("evnt",dto);
		
		
		return"/event/updateform";
	}//eventUform
	
	
	
	
	
	
	//희규
	@RequestMapping(value = "/event/update/")
	public void updateEvent(EventDTO dto , PrintWriter out ) throws IOException {
		
		File newFolder = new File("C:/upload/test/");
		if(newFolder.exists()==false) newFolder.mkdirs();

		MultipartFile file = dto.getEvnt_thum_file();
		InputStream is = file.getInputStream();
		FileOutputStream fos = new FileOutputStream("C:/upload/test/" + file.getOriginalFilename());
			
		FileCopyUtils.copy(is,fos);
		is.close();
		fos.close();
		
		dto.setEvnt_thum_name( file.getOriginalFilename());
		dto.setEvnt_thum_path("/upload/test/" + file.getOriginalFilename());

		MultipartFile file2 = dto.getEvnt_pic_file();
		if(!file2.isEmpty()) {
			InputStream is2 = file2.getInputStream();
			FileOutputStream fos2 = new FileOutputStream("C:/upload/test/" + file2.getOriginalFilename());
	
			FileCopyUtils.copy(is2,fos2);
			is2.close();
			fos2.close();

			dto.setEvnt_pic_name(file2.getOriginalFilename());
			dto.setEvnt_pic_path("/upload/product" + "/" + file2.getOriginalFilename() );
		}
		
		int successCount = 0;
		successCount=service.update(dto);
		out.print(successCount);
		out.close();
		
		
		
		
		return;
	}//updateEvent
	
	
	
	
	
	
	
}//class
