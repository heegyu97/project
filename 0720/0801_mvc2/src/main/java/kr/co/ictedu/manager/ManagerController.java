package kr.co.ictedu.manager;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;
import kr.co.ictedu.util.dto.SearchDTO;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	
	
	@Autowired
	private ManagerService service;
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET )	
	public String myPage() {
		return "/manager/myPage";//jsp file name
	}//productList
	
	@RequestMapping(value = "/myPrivacy", method = RequestMethod.GET )	
	public String myPrivacy() {
		return "/manager/myPrivacy";//jsp file name
	}//productList
	
	
	//0812 생성
	
	@RequestMapping(value = "/membermanagement_detail", method = RequestMethod.GET )	
	public String membermanagement_detail(MemberDTO dto,Model model) {
		MemberDTO list = null;
		list = service.searchMember(dto);
		model.addAttribute("member_dto", list);
		return "/manager/membermanagement_detail";//jsp file name
	}//membermanagement_detail
	
	@RequestMapping(value = "/membermanagement_delete", method = RequestMethod.GET )	
	public void membermanagement_delete(String m_no,PrintWriter out) {
		int successCount = 0;
		successCount = service.membermanagement_delete(m_no);
		out.print(successCount);
		out.close();
	}//membermanagement_detail
	
	
	@RequestMapping(value = "/membermanagement_update", method = RequestMethod.GET )	
	public String membermanagement_update() {
		return "/manager/membermanagement_update";//jsp file name
	}//productList
	
	
	@RequestMapping(value = "/membermanagement", method = RequestMethod.GET )	
	public String membermanagement(Model model, String userWantPage, SearchDTO dto) {
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
		
		List<MemberDTO> list = null;
		list = service.searchList(dto);
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/manager/membermanagement";//jsp file name
	}//membermanagement
	
	@RequestMapping(value = "/saleshistory_detail", method = RequestMethod.GET )	
	public String saleshistory_detail() {
		return "/manager/saleshistory_detail";//jsp file name
	}//saleshistory_detail
	
	@RequestMapping(value = "/saleshistory", method = RequestMethod.GET )	
	public String saleshistory() {
		return "/manager/saleshistory";//jsp file name
	}//productList
	
	@RequestMapping(value = "/managerMain", method = RequestMethod.GET)
	public String managerMain() {
		return "/manager/managerMain";//jsp file name
	}//main
	
	//08-18 lee
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
	
}