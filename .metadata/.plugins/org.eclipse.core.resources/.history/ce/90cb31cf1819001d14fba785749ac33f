package kr.co.ictedu.tip;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ictedu.util.dto.TipDTO;

@Controller
@RequestMapping(value = "/tip")
public class TipController {
	
	private final Logger logger = LoggerFactory.getLogger(TipController.class);
	
	@Autowired
	private TipService service;
	
	@RequestMapping(value = "/ajax_upload", method = RequestMethod.POST)
	public void ajaxUpload(TipDTO dto, PrintWriter out) throws IOException {
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		File newFolder = new File("C:/upload" + todayNalja + "/");
		if(newFolder.exists()==false) newFolder.mkdirs();
		
		MultipartFile file = dto.getTip_prdt_pic();
		
		InputStream is = file.getInputStream();
		FileOutputStream fos 
			= new FileOutputStream(newFolder + "/" + todaySigan + "_"+file.getOriginalFilename());
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		
		dto.setTip_prdt_path(newFolder + "/" + todaySigan + "_"+file.getOriginalFilename());
		
		int successCount =1;
		out.print(successCount);
		out.close();

		
	}//ajaxUpload
	
	
	
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public void write(TipDTO dto, HttpSession session, PrintWriter out) {
		int successCount=0;
		//로그인정보가져오기
		//dto.serM_no(mDto.getM_no());
		successCount=service.write(dto);
		out.print(successCount);
		out.close();
		
	}//write
	
	
	
	@RequestMapping(value = "/tipwriteform", method = RequestMethod.GET)
	public String writeForm() {
		return"/tip/tipwriteform";
	}//writeForm
	
	
	
	@RequestMapping(value = "/tip", method = RequestMethod.GET)
	public String tip() {
		return"/tip/tip";
	}//tip
	
	
	@RequestMapping(value = "/tipdetail", method = RequestMethod.GET)
	public String tipDetail() {
		
		
		//logger.info(board_no);//tip.jsp에서 값넘어오는지확인//삭제예정
		
		return"/tip/tipdetail";
	}//tipDetail
	
	@RequestMapping(value = "/tipupdate",method= RequestMethod.POST)
	public void update(TipDTO dto , PrintWriter out) {
		int successCount = 0;
		successCount=service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	
	@RequestMapping(value = "/tipupdateform", method = RequestMethod.GET )
	public String updateForm() {
		
		
		return"/tip/tipupdateform";
	}//updateForm
	
	
	
	
	
	

}//class
