package kr.co.ictedu.tip;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartRequest;

import kr.co.ictedu.util.dto.SearchDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Controller
@RequestMapping(value = "/tip")
public class TipController {
	
	private final Logger logger = LoggerFactory.getLogger(TipController.class);
	
	@Autowired
	private TipService service;
	
	
//	@RequestMapping(value = "/pasinglist", method = RequestMethod.GET)
//	public String pasingList(Model model, String userWantPage ) {
//		if(userWantPage == null || userWantPage.equals("")) userWantPage = "1";
//		int totalCount = 0,startPageNum = 1, endPageNum=1;
//		totalCount =service.totalListCount();
//		
//		
//		if(totalCount >10) {
//			endPageNum =(totalCount /10 ) + (totalCount % 10 > 0 ? 1 : 0);
//		}//if
//		model.addAttribute("startPageNum", startPageNum);
//		model.addAttribute("endPageNum", endPageNum);
//		model.addAttribute("userWantPage", userWantPage);
//
//		
//		int limitNum = (Integer.parseInt(userWantPage) - 1) * 10;
//		List<TipDTO>list = null;
//		list = service.pagingList(limitNum);
//		model.addAttribute("list", list);
//
//		
//		return"/tip/tip";
//	}//pasingList
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search( SearchDTO dto, Model model) {
		
		
		return"/tip/tip";
	}//search
	
	
//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	public String list( Model model  ) {
//
//		List<TipDTO> list = null;
//		list = service.list();
//		model.addAttribute("list", list);
//		
//		return "/tip/tip";//jsp file name
//	}//list
	
	
	@RequestMapping(value = "/ajax_upload", method = RequestMethod.POST)
	public void ajaxUpload(TipDTO dto, PrintWriter out) throws IOException {
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		File newFolder = new File("C:/upload/" + todayNalja + "/");
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile file = dto.getUpload_file();

		InputStream is = file.getInputStream();
		FileOutputStream fos
			= new FileOutputStream( newFolder + "/" + todaySigan + "_" + file.getOriginalFilename() );
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();

		dto.setTip_prdt_path( newFolder + "/" + todaySigan + "_" + file.getOriginalFilename() );
		dto.setTip_prdt_pic(file.getOriginalFilename());

		int successCount = 0;
		successCount=service.write(dto);
		out.print(successCount);
		out.close();
		
	}//ajaxUpload
	
	
	
//	@RequestMapping(value = "/write", method=RequestMethod.POST)
//	public void write(TipDTO dto, HttpSession session, PrintWriter out) {
//		int successCount=0;
//		//로그인정보가져오기
//		//dto.serM_no(mDto.getM_no());
//		successCount=service.write(dto);
//		out.print(successCount);
//		out.close();
////		
//	}//write
	
	
	
	@RequestMapping(value = "/tipwriteform", method = RequestMethod.GET)
	public String writeForm() {
		return"/tip/tipwriteform";
	}//writeForm
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/tip", method = RequestMethod.GET)
	public String tip( Model model, String userWantPage, SearchDTO dto ) {
		
		
		//test pagingList
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		
		if(totalCount >10) {
			lastPageNum =(totalCount /10 ) + (totalCount % 10 > 0 ? 1 : 0);
		}//if
		
		
		if(userWantPage.length() >= 2) {
			String frontNum = userWantPage.substring(0,userWantPage.length()-1);//25 -> 2 
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;//21
			endPageNum = ( Integer.parseInt(frontNum) +1 ) * 10;//30
			
			String backNum = userWantPage.substring(userWantPage.length()-1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum -10;
				endPageNum = endPageNum -10;
			}//if
		}//if
		
		
		if(endPageNum > lastPageNum) {
			endPageNum = lastPageNum;
		}//if

		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("userWantPage", userWantPage);
		model.addAttribute("lastPageNum", lastPageNum);
		
		
		
		
		dto.setLimitNum((Integer.parseInt(userWantPage) - 1) * 10);//페이지 누를떄마다 변환 1~10,11~20
		List<TipDTO>list = null;
		list = service.searchList(dto);
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);

		//test
		
		
		
		
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
