package kr.co.ictedu.guest;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import kr.co.ictedu.util.dto.HistoryDTO;
import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;


@Controller
@RequestMapping(value = "/guest")
public class GuestController<CommenCodeDTO> {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	@Autowired
	private GuestService service;
	
	//이준혁 조회2
		@RequestMapping(value = "/sellcom_detail", method = RequestMethod.GET)
		public String sellcom_detail(HistoryDTO dto, HttpSession session, PrintWriter out) {
			dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
			
			
			System.out.println(dto.getM_no()+"~~~~~~~~~~~~~~~~~~~~");
			System.out.println(dto.getOrd_no()+"~~~~~~~~~~~~~~~~~~~~");
			List<HistoryDTO>list=null;
			list = service.paydetail(dto);
			out.print(new Gson().toJson( list ) );
			out.close();
			
			
			return "/guest/sellcom_detail";
		}
		
		
		//이준혁 조회1
		@RequestMapping(value = "/sellcom", method = RequestMethod.GET)
		public String sellcom(Model model, String userWantPage, SearchDTO dto, HttpSession session) {
			
			dto.setM_no( ( (MemberDTO) session.getAttribute("login_info") ).getM_no() );
			
			
			if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
			int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
			totalCount = service.searchordCount(dto);
			
			
			if(totalCount > 10) {
				lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
			}//if
			
			if(userWantPage.length() >= 2) { 
				String frontNum = userWantPage.substring(0, userWantPage.length() - 1);
				
				startPageNum = Integer.parseInt(frontNum) * 10 + 1;
				endPageNum = ( Integer.parseInt(frontNum) + 1 ) * 10;
				
				String backNum = userWantPage.substring(userWantPage.length() - 1, userWantPage.length());
				if(backNum.equals("0")) {
					startPageNum = startPageNum - 10;
					endPageNum = endPageNum - 10;
				}//if
			}//if
			
			
			if(endPageNum > lastPageNum) endPageNum = lastPageNum;

			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);
			model.addAttribute("lastPageNum", lastPageNum);
			model.addAttribute("userWantPage", userWantPage);

			dto.setLimitNum(( Integer.parseInt(userWantPage) - 1 ) * 10  );

			
			
			List<HistoryDTO> list = null;
			list = service.ordList(dto);
			model.addAttribute("list", list);
			
			
			
			return "/guest/sellcom";
		}//sellcom
		
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String pro_no, Model model) {
		ProductDTO dto = null;
		dto = service.detail( pro_no );
		model.addAttribute("dto", dto);
		return "/guest/detail";
	}//detail
	
	@RequestMapping(value = "/productList", method = RequestMethod.GET )	
	public String productList(Model model, String userWantPage, SearchDTO dto) {
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		System.out.println(totalCount);
		
		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if
		System.out.println(lastPageNum);
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
		
		return "/guest/productList";//jsp file name
	}//productList	
	
	//	변경필요 ->  카테고리 값 불러오기 + search리스트에 카테고리 저장변수추가
	@RequestMapping(value = "/KategorieList", method = RequestMethod.GET )	
	public String KategorieList(Model model, String userWantPage, SearchDTO dto , String select_pro_big) {
		
		//kategorie 기준 나누기 필요!!
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		System.out.println(totalCount);
		if(totalCount > 10) {//201 -> (201 /10) + (201 % 10 > 0 ? 1 : 0) -> 20 + 1
			lastPageNum = (totalCount / 10) + (totalCount % 10 > 0 ? 1 : 0);
		}//if
		System.out.println(lastPageNum);
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
		
		
		//대분류
		List<CommenCodeDTO> proBigList = null;
		
		proBigList = service.bigSelect();
		model.addAttribute("proBigList", proBigList);
		logger.info(list.toString());
		
		return "/guest/KategorieList";//jsp file name --search
	}//productList
	
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET )	
	public String myPage() {
		return "/guest/myPage";//jsp file name
	}//productList
	
	@RequestMapping(value = "/myPrivacy", method = RequestMethod.GET )	
	public String myPrivacy() {
		return "/guest/myPrivacy";//jsp file name
	}//productList
	
	
	@RequestMapping(value = "/deleteid", method = RequestMethod.GET )	
	public void deleteid(MemberDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.deleteid( dto );
		out.print(successCount);
		out.close();
	}//deleteid
	
	@RequestMapping(value = "/updateid", method = RequestMethod.POST )	
	public void updateid(MemberDTO dto, PrintWriter out) {
		int successCount = 0;
		successCount = service.updateid( dto );
		out.print(successCount);
		out.close();
	}//update
	
	@RequestMapping( value = "/big", method = RequestMethod.GET)
	public void big(String pro_no,  String select_pro_big, PrintWriter out) {
		List<CommenCodeDTO> proMidList = null;
		proMidList = service.midSelect(select_pro_big);
		System.out.println("select_pro_big:" + select_pro_big);
		System.out.println(proMidList.toString());
		out.print(new Gson().toJson(proMidList));
		out.close();
	}//big - 중분류 가져옴
	
	
	
	
	
}//class
