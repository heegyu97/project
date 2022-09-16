package kr.co.ictedu.main;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.RoomDTO;


@Controller
@RequestMapping( value = "/main" )
public class SelectController {
	
	@Autowired
	private SelectService service;
	
	
	@RequestMapping( value = "/select", method = RequestMethod.GET )
	public String list( Model model , RoomDTO dto, HttpSession session,String userWantPage) {
		
		String mno = ( (MemberDTO) session.getAttribute("login_info") ).getM_no();
		dto.setM_no(mno); 
		
		if( userWantPage == null || userWantPage.equals("") ) userWantPage = "1";
		int totalCount = 0, startPageNum = 1, endPageNum = 10, lastPageNum = 1;
		totalCount = service.searchListCount( dto );
		
		if(totalCount > 3) {
			lastPageNum = (totalCount / 3) + (totalCount % 3 > 0 ? 1 : 0);
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

		System.out.println(totalCount + ":" +startPageNum + ":" + endPageNum+ ":" + lastPageNum);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("userWantPage", userWantPage);

		dto.setLimitNum( ( Integer.parseInt(userWantPage) - 1 ) * 3  );//리스트 3개만 보이게하기
		
		List<RoomDTO> list = null;
		
		System.out.println(dto.getM_no());
		list = service.list(dto);
		model.addAttribute("list", list);
		return "/main/select";// jsp file name
			
	}//list
	
	

}//class
