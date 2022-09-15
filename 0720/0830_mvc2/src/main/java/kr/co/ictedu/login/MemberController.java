package kr.co.ictedu.login;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;

	@Autowired
	private LoginService service;

	
	@RequestMapping(value="login/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, MemberDTO dto, HttpSession session) throws Exception {
		System.out.println("#########" + code);
		String access_Token = ms.getAccessToken(code);
		System.out.println("1");
		//유저정보 불러오기
		HashMap<String, Object> userInfo = ms.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		
		//내가 소스코드 지정 : 로그인 확인
		MemberDTO dtoFromDB = null;
		System.out.println(userInfo.get("email"));
		dto.setM_email((String) userInfo.get("email"));
		dtoFromDB = service.idCheck( dto.getM_email()); // 네이버 로그인을 통해 들어온 유저가 그 전에 가입한 적이있는지 확인
		System.out.println(dtoFromDB  + "확인");
		
		if(dtoFromDB != null && !dtoFromDB.equals("")) {
			System.out.println("뿎2");
			//로그인하기
			MemberDTO dtoFromDB2 = null;
			dtoFromDB2 = service.login( dtoFromDB );
			session.setAttribute("login_info", dtoFromDB2);
			//로그인 이후 경로
			return "redirect:/main/select";
		}else {
			System.out.println("뿎1");
			//null값 - 회원가입 이메일만 정보보냄
			session.setAttribute("email_save", dto.getM_email());
			//로그인 실패시 이동경로
			return "redirect:/login/sign";
		}
   	}

}