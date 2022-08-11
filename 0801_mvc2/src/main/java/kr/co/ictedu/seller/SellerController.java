package kr.co.ictedu.seller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;




@Controller
@RequestMapping(value = "/seller")
public class SellerController {
	
	
	@Autowired
	private SellerService service;
	
//	@RequestMapping( value = "/insert", method = RequestMethod.POST )
//	public void insert( ProductDTO dto, HttpSession session, PrintWriter out ) throws IOException {
//
//		Date today = new Date();
//		DateFormat nalja = new SimpleDateFormat("YYYYMMDD");
//		DateFormat sigan = new SimpleDateFormat("HHmmss");
//		String todayNalja = nalja.format(today);
//		String todaySigan = sigan.format(today);
//
//		String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
//		File newFolder = new File("C:/upload/product/" + mid + "/");
//		if( newFolder.exists() == false ) newFolder.mkdirs();
//
//		MultipartFile thumbnail = dto.getThumbnail();
//		InputStream is = thumbnail.getInputStream();
//		FileOutputStream fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//													+ todaySigan + "_" + thumbnail.getOriginalFilename() );
//		FileCopyUtils.copy(is, fos);
//		is.close();
//		fos.close();
//		dto.setThumbnail_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
//		dto.setThumbnail_path("/upload/product/" + mid + "/" + todayNalja + "_"
//								+ todaySigan + "_" + thumbnail.getOriginalFilename());
//
//		MultipartFile prdt_img = dto.getPrdt_img();
//		if(prdt_img != null && !prdt_img.getOriginalFilename().equals("")) {
//			is = prdt_img.getInputStream();
//			fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//										+ todaySigan + "_" + prdt_img.getOriginalFilename() );
//			FileCopyUtils.copy(is, fos);
//			is.close();
//			fos.close();
//			dto.setPrdt_img_name(todayNalja + "_" + todaySigan + "_" + prdt_img.getOriginalFilename());
//			dto.setPrdt_img_path("/upload/product/" + mid + "/" + todayNalja + "_"
//									+ todaySigan + "_" + prdt_img.getOriginalFilename());
//		}
//
//		MultipartFile desc_img = dto.getDesc_img();
//		if(desc_img != null && !desc_img.getOriginalFilename().equals("")) {
//			is = desc_img.getInputStream();
//			fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//										+ todaySigan + "_" + desc_img.getOriginalFilename() );
//			FileCopyUtils.copy(is, fos);
//			is.close();
//			fos.close();
//			dto.setDesc_img_name(todayNalja + "_" + todaySigan + "_" + desc_img.getOriginalFilename());
//			dto.setDesc_img_path("/upload/product/" + mid + "/" + todayNalja + "_"
//									+ todaySigan + "_" + desc_img.getOriginalFilename());
//		}
//
//		MultipartFile add_file = dto.getAdd_file();
//		if(add_file != null && !add_file.getOriginalFilename().equals("")) {
//			is = add_file.getInputStream();
//			fos = new FileOutputStream( "C:/upload/product/" + mid + "/" + todayNalja + "_"
//										+ todaySigan + "_" + add_file.getOriginalFilename() );
//			FileCopyUtils.copy(is, fos);
//			is.close();
//			fos.close();
//			dto.setAdd_file_name(todayNalja + "_" + todaySigan + "_" + add_file.getOriginalFilename());
//			dto.setAdd_file_path("/upload/product/" + mid + "/" + todayNalja + "_"
//									+ todaySigan + "_" + add_file.getOriginalFilename());
//		}
//
//		dto.setMno( ( (MemberDTO) session.getAttribute("login_info") ).getMno() );
//
//		int successCount = 0;
//		successCount = service.insert(dto);
//		out.print(successCount);
//		out.close();
//	}//insert
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String form() {
		return "/seller/form";//jsp file name
	}//form
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET )	
	public String productList() {
		return "/seller/productList";//jsp file name
	}//productList
	
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public String sellerMain() {
		return "/seller/sellerMain";//jsp file name
	}//main
	
}//class
