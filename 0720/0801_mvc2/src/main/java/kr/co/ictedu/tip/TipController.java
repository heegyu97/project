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

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Controller
@RequestMapping(value = "/tip")
public class TipController {
	
	private final Logger logger = LoggerFactory.getLogger(TipController.class);
	
	@Autowired
	private TipService service;
	
	
	@RequestMapping(value = "/tipdelete", method = RequestMethod.GET)
	public void tipDelete(String tip_no, PrintWriter out) {
		int successCount = 0;
		successCount = service.delete(tip_no);
		
		out.print(successCount);
		out.close();
		
	}//tipDelete
	
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search( SearchDTO dto, Model model) {
		
		
		return"/tip/tip";
	}//search
	
	
	
	//글등록 완료
	@RequestMapping(value = "/tipwrite", method = RequestMethod.POST)
	public void tipwrite(TipDTO dto, PrintWriter out, HttpSession session ) throws IOException {
		
		MemberDTO mDto = (MemberDTO)session.getAttribute("login_info");
		
		dto.setM_no(mDto.getM_no());
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		File newFolder = new File("C:/upload/" + todayNalja );
		if( newFolder.exists() == false ) newFolder.mkdirs();

		
		
		MultipartFile file = dto.getUpload_file();
	      if(!file.isEmpty()) {
	         InputStream is2 = file.getInputStream();
	         FileOutputStream fos2 = new FileOutputStream("C:/upload/test/" + file.getOriginalFilename());
	   
	         FileCopyUtils.copy(is2,fos2);
	         is2.close();
	         fos2.close();

	         dto.setTip_prdt_path( "/upload/" + todayNalja + "/" + todaySigan + "_" + file.getOriginalFilename() );
	         dto.setTip_prdt_pic( todaySigan + "_" + file.getOriginalFilename());

	      }
	      
	      int successCount = 0;
	      successCount=service.write(dto);
		

		out.print(successCount);
		out.close();
		
	}//tipwrite
	
	
	
	
	
	//글등록 화면으로이동
	@RequestMapping(value = "/tipwriteform", method = RequestMethod.GET)
	public String writeForm( Model model, String m_no, HttpSession session, MemberDTO dto) {
		MemberDTO mDto = (MemberDTO)session.getAttribute("login_info");
		
		return"/tip/tipwriteform";
	}//writeForm
	
	
	
	
	
	
	
	
	
	//검색,페이징
	@RequestMapping(value = "/tip", method = RequestMethod.GET)
	public String tip( Model model, String userWantPage, SearchDTO dto) {
		
		
		
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
	public String tipDetail(String tip_no, Model model, HttpSession session ) {
		
		MemberDTO mDto = (MemberDTO)session.getAttribute("login_info");
		
		
		TipDTO dto = null;
		dto = service.tipdetail(tip_no);
		model.addAttribute("detail", dto);
		
		
		return"/tip/tipdetail";
	}//tipDetail
	
	
	
	
	//업데이트 하는곳
	@RequestMapping(value = "/tipupdate",method= RequestMethod.POST)
	public void update(TipDTO dto , PrintWriter out) throws IOException{//IOException하는 이유 알아보기
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		File newFolder = new File("C:/upload/" + todayNalja );
		if( newFolder.exists() == false ) newFolder.mkdirs();

		
		InputStream is=null;
		FileOutputStream fos =null;
		
		MultipartFile file = dto.getUpload_file();
		if(file != null && !file.getOriginalFilename().equals("")) {
		
		
			is = file.getInputStream();
			fos = new FileOutputStream( "C:/upload/" + todayNalja + "/" + todaySigan + "_" + file.getOriginalFilename() );
			
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			dto.setTip_prdt_path( "/upload/" + todayNalja + "/" + todaySigan + "_" + file.getOriginalFilename() );
			dto.setTip_prdt_pic( todaySigan + "_" + file.getOriginalFilename());
		}
		
		
		int successCount = 0;
		//확인용 삭제예정
		logger.info(dto.getTip_title()+"제목들어가는거확인");
		logger.info(dto.getTip_ctnts()+"내용들어가는거확인");
		logger.info(dto.getTip_prdt_path()+"경로들어가는거확인");
		logger.info(dto.getTip_prdt_pic()+"파일이름들어가는거확인");
		logger.info(dto.getTip_no()+"tip_no들어가는거확인");
		//
		
		
		successCount=service.update(dto);
		out.print(successCount);
		out.close();
	}//update
	
	
	//업데이트 form화면
	@RequestMapping(value = "/tipupdateform", method = RequestMethod.GET )
	public String updateForm(String tip_no, Model model, HttpSession session) {
		
		MemberDTO mDto = (MemberDTO)session.getAttribute("login_info");
		
		TipDTO dto = null;
		dto = service.tipdetail(tip_no);
		model.addAttribute("detail",dto);
		
				
		
		
		return"/tip/tipupdateform";
	}//updateForm
	
	//수정하기 페이지 에서 이미지 삭제하는곳
	@RequestMapping(value = "/filedelete", method = RequestMethod.GET)
	public void fileDelete( String id, String path, TipDTO dto, HttpSession session, PrintWriter out ) {
		File file = new File("C:" + path);
		file.delete();

		if(id.equals("thumbnail_btn")) {
			dto.setTip_prdt_pic( path.substring(path.lastIndexOf("/") + 1) );
			dto.setTip_prdt_path(path);
		} 

		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );로그인체크

		int successCount = 0;
		successCount = service.fileDelete( dto );
		out.print(successCount);
		out.close();
	}//fileDelete
	
	
	
	

}//class
