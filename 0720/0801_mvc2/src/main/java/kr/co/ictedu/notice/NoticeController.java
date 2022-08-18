package kr.co.ictedu.notice;

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

import kr.co.ictedu.util.dto.NoticeDTO;
import kr.co.ictedu.util.dto.SearchDTO;
import kr.co.ictedu.util.dto.TipDTO;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {

	private final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService service;
	
	
	
	//수정하는 페이지 에서 이미지 삭제하는곳
	@RequestMapping(value = "/filedelete", method = RequestMethod.GET)
	public void fileDelete( String id, String path, NoticeDTO dto, HttpSession session, PrintWriter out ) {
		File file = new File("C:" + path);
		file.delete();

		if(id.equals("thumbnail_btn")) {
			dto.setNoti_pic( path.substring(path.lastIndexOf("/") + 1) );
			dto.setNoti_path(path);
		} 

		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );로그인체크

		int successCount = 0;
		successCount = service.fileDelete( dto );
		out.print(successCount);
		out.close();
	}//fileDelete
	
	
	
	//업데이트 form 화면으로 이동
	@RequestMapping(value = "/noticeupdateform", method = RequestMethod.GET)
	public String noticeUpdateForm( String noti_no, Model model) {
		NoticeDTO dto =null;
		dto = service.detail(noti_no);//detail에 있는 데이터를 불러오는부분이라 detail로 중복사용함
		model.addAttribute("detail", dto);
		
		return"notice/noticeupdateform";
	}//noticeUpdateForm
	
	
	
	
	//디테일 화면
	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
	public String noticeDetail(String noti_no, Model model) {
		
		NoticeDTO dto = null;
		dto = service.detail(noti_no);
		
		model.addAttribute("detail", dto);
		
		
		return"/notice/noticedetail";
		
	}//noticeDetail
	
	
	
	
	//검색, 페이징,첫화면
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(Model model, String userWantPage, SearchDTO dto) {
		
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
		List<NoticeDTO>list = null;
		list = service.searchList(dto);
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);

		return"/notice/notice";
	}//notice
	
	
	
	
	//글 등록 완료
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public void noticeWrite(NoticeDTO dto, PrintWriter out) throws IOException{
		
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		File newFolder = new File("C:/upload/notice/" + todayNalja );
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile file = dto.getUpload_file();
		InputStream is = file.getInputStream();
		
		FileOutputStream fos
		= new FileOutputStream( "C:/upload/notice/" + todayNalja + "/" + todaySigan + "_" + file.getOriginalFilename() );
		
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		
		dto.setNoti_path( "/upload/notice/" + todayNalja + "/" + todaySigan + "_" + file.getOriginalFilename() );
		dto.setNoti_pic( todaySigan + "_" + file.getOriginalFilename());

		int successCount = 0;
		successCount=service.write(dto);
		out.print(successCount);
		out.close();
		
		
	}//noticeWrite
	
	
	
	
	//글등록 페이지 이동
	@RequestMapping(value = "/noticewriteform", method = RequestMethod.GET)
	public String noticeWriteForm() {
		return"/notice/noticewriteform";
	}//noticeWriteForm
	
	
	
	
	
	@RequestMapping(value = "/noticeupdate", method = RequestMethod.POST)
	public void noticeUpdate(NoticeDTO dto, PrintWriter out) {
		int successCount=0;
		
		successCount = service.update(dto);
		out.print(successCount);
		out.close();
	}//noticeUpdate
	
	
	
//	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
//	public String  noticeDetail() {
//		
//		return"/notice/noticedetail";
//	}//noticeDetail
	
	
	
	
	
	
}//class
