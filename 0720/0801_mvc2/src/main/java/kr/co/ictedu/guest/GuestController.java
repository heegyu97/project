package kr.co.ictedu.guest;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.ProductDTO;
import kr.co.ictedu.util.dto.SearchDTO;


@Controller
@RequestMapping(value = "/guest")
public class GuestController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	@Autowired
	private GuestService service;
	
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
		
		return "/guest/productList";//jsp file name
	}//productList
	
	
}//class
