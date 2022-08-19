package kr.co.ictedu.seller;

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

import com.google.gson.Gson;

import kr.co.ictedu.util.dto.CommenCodeDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;




@Controller
@RequestMapping(value = "/seller")
public class SellerController {
	
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);
	
	@Autowired
	private SellerService service;
	
	@RequestMapping( value = "/update", method = RequestMethod.POST )
	public void update( ProductDTO dto, HttpSession session, PrintWriter out ) throws IOException {

		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

//		String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
//		File newFolder = new File("C:/upload/product/" + mid + "/");
		File newFolder = new File("C:/upload/product/" + "test/");
		if( newFolder.exists() == false ) newFolder.mkdirs();

		InputStream is = null;
		FileOutputStream fos = null;

		MultipartFile thumbnail = dto.getThumbnail();
		if(thumbnail != null && !thumbnail.getOriginalFilename().equals("")) {
			is = thumbnail.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/"+ todayNalja + "_"
														+ todaySigan + "_" + thumbnail.getOriginalFilename() );
//			fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//					+ todaySigan + "_" + thumbnail.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setPro_thum_pic(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
			dto.setPro_thum_path("/upload/product/" + todayNalja + "_"
									+ todaySigan + "_" + thumbnail.getOriginalFilename());
//			dto.setPro_thum_path("/upload/product/" + mid + "/" + todayNalja + "_"
//					+ todaySigan + "_" + thumbnail.getOriginalFilename());
		}

		MultipartFile prdt_img = dto.getPrdt_img();
		if(prdt_img != null && !prdt_img.getOriginalFilename().equals("")) {
			is = prdt_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/" + todayNalja + "_"
										+ todaySigan + "_" + prdt_img.getOriginalFilename() );
//			fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//					+ todaySigan + "_" + prdt_img.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setPro_prdt_pic(todayNalja + "_" + todaySigan + "_" + prdt_img.getOriginalFilename());
			dto.setPro_prdt_path("/upload/product/" + todayNalja + "_"
									+ todaySigan + "_" + prdt_img.getOriginalFilename());
//			dto.setPro_prdt_path("/upload/product/" + mid + "/" + todayNalja + "_"
//					+ todaySigan + "_" + prdt_img.getOriginalFilename());
		}

//		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/file/delete", method = RequestMethod.GET )
	public void fileDelete( String id, String path, ProductDTO dto, HttpSession session, PrintWriter out ) {
		File file = new File("C:" + path);
		file.delete();

		if(id.equals("thumbnail_btn")) {
			dto.setPro_thum_pic( path.substring(path.lastIndexOf("/") + 1) );
			dto.setPro_thum_path(path);
		} else if(id.equals("prdt_img_btn")) {
			dto.setPro_prdt_pic( path.substring(path.lastIndexOf("/") + 1) );
			dto.setPro_prdt_path(path);
		}
		//dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.fileDelete( dto );
		out.print(successCount);
		out.close();
	}//fileDelete
	
	
	@RequestMapping( value = "/uform", method = RequestMethod.GET )
	public String updateForm( String pro_no, String pro_big, Model model ) {
		ProductDTO dto = null;
		dto = service.detail( pro_no );

		List<CommenCodeDTO> proBigList = null;
		proBigList = service.bigSelect();

		//dto.getPro_big() -> pro_mid를 select해서 list로 model.addAttribute("list", list);
		List<CommenCodeDTO> list = null;
		list = service.midSelect(dto.getPro_big());
		System.out.println("대 분류: " + pro_big);
		
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("proBigList", proBigList);
		logger.info(list.toString());
		return "/seller/uform";//jsp file name
	}//updateForm
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void delete(ProductDTO dto, HttpSession session, PrintWriter out) {
		
		if(!dto.getPro_thum_path().equals("")) {
			File file = new File("C:" + dto.getPro_thum_path());
			file.delete();
		}
		if(!dto.getPro_prdt_path().equals("")) {
			File file = new File("C:" + dto.getPro_prdt_path());
			file.delete();
		}
//		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
		
	}//delete
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String pro_no, Model model) {
		ProductDTO dto = null;
		dto = service.detail( pro_no );
		model.addAttribute("dto", dto);
		
		return "/seller/detail";
	}//detail
	
	
	@RequestMapping( value = "/insert", method = RequestMethod.POST )
	public void insert( ProductDTO dto, HttpSession session, PrintWriter out ) throws IOException {

		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

	//	String m_id = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
	//	File newFolder = new File("C:/upload/product/" + mid + "/");
		File newFolder = new File("C:/upload/product/" + "test/");
		if( newFolder.exists() == false ) newFolder.mkdirs();
		logger.info(dto.getPro_name());
		logger.info(dto.getPro_stock());
		logger.info(dto.getPro_ship());
		logger.info(dto.getPro_ship_free());
		logger.info(dto.getPro_price());
		logger.info(dto.getPro_dc());
		logger.info(dto.getPro_thum_pic());
		logger.info(dto.getPro_thum_path());
		logger.info(dto.getPro_ctnts());

		//썸네일
		MultipartFile thumbnail = dto.getThumbnail();
		InputStream is = thumbnail.getInputStream();
		FileOutputStream fos = new FileOutputStream( "C:/upload/product/" + todayNalja + "_"
													+ todaySigan + "_" + thumbnail.getOriginalFilename() );
//						fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//													+ todaySigan + "_" + thumbnail.getOriginalFilename() );

		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		
		dto.setPro_thum_pic(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
//		dto.setThumbnail_path("/upload/product/" + mid + "/" + todayNalja + "_"
//								+ todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setPro_thum_path("/upload/product/"  + "/" + todayNalja + "_"
				+ todaySigan + "_" + thumbnail.getOriginalFilename());
		//상품설명이미지
		MultipartFile prdt_img = dto.getPrdt_img();
		if(prdt_img != null && !prdt_img.getOriginalFilename().equals("")) {
			is = prdt_img.getInputStream();
			fos = new FileOutputStream( "C:/upload/product/"   + todayNalja + "_"
										+ todaySigan + "_" + prdt_img.getOriginalFilename() );
//			fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//					+ todaySigan + "_" + prdt_img.getOriginalFilename() );
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			dto.setPro_prdt_pic(todayNalja + "_" + todaySigan + "_" + prdt_img.getOriginalFilename());
//			dto.setPrdt_img_path("/upload/product/" + mid + "/" + todayNalja + "_"
//									+ todaySigan + "_" + prdt_img.getOriginalFilename());
			dto.setPro_prdt_path("/upload/product/"  + "/" + todayNalja + "_"
									+ todaySigan + "_" + prdt_img.getOriginalFilename());
		}

//		dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );

		int successCount = 0;
		successCount = service.insert(dto);
		out.print(successCount);
		out.close();
	}//insert
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form() {
		return "/seller/form";//jsp file name
	}//form
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET )	
	public String productList( Model model, String userWantPage, SearchDTO dto ) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		
		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if
		
		if(userWantPage.length() >= 2) { //userWantPage가 12인 경우 startPageNum는 11, endPageNum는 20.
			String frontNum = userWantPage.substring(0, userWantPage.length() - 1);//12 -> 1
			
			startPageNum = Integer.parseInt(frontNum) * 10 + 1;// 1 * 10 + 1 -> 11
			endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;// (1 + 1) * 10 -> 20
			//userWantPage가 10인 경우, startPageNum는 11, endPageNum는 20.
			String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
			if(backNum.equals("0")) {
				startPageNum = startPageNum - 10;// 11 - 10 -> 1
				endPageNum = endPageNum - 10;// 20 - 10 -> 10
			}//if
		}//if
		
		//endPageNum이 20이고, lastPageNum이 17이라면, endPageNum을 17로 수정해라
		if(endPageNum > lastPageNum) endPageNum = lastPageNum;

		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum(( Integer.parseInt(userWantPage) - 1 ) * 10  );

		List<ProductDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		
		return "/seller/productList";//jsp file name
	}//productList
	
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public String sellerMain() {
		return "/seller/sellerMain";//jsp file name
	}//main
	
}//class
