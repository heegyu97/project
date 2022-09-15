package kr.co.ictedu.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.ictedu.util.dto.MemberDTO;

import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;

import com.github.scribejava.core.model.OAuth2AccessToken;


@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private LoginService service;

	@RequestMapping( value = "/logout", method = RequestMethod.GET )
	public String logout( HttpSession session ) {
		session.invalidate();
		return "redirect:/login/login_form";
	}//logout

	@RequestMapping( value = "/login", method = RequestMethod.POST )
	public void login( MemberDTO dto, PrintWriter out, HttpSession session ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = service.login( dto );
		if( dtoFromDB == null ) {
			out.print(0);//아이디 없는 사용자 또는 패스워드 오류 사용자.
		} else if( dtoFromDB != null && dtoFromDB.getM_no() != null && dtoFromDB.getM_no() != "" ) {
			out.print(1);//아이디, 패스워드 모두 OK
			session.setAttribute("login_info", dtoFromDB);
		}
		out.close();

	}//login

	
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	// 로그인 첫 화면 요청 메소드 기존 + google 추가
	@RequestMapping( value = "/login/login_form", method = RequestMethod.GET )
	public String login_form( Model model, HttpSession session) {
		String APIurl = "AIzaSyBAgKG9rjteIn9MqguziKPd-T7YWa37IfE";
		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		System.out.println("url 확인 : " + url);

		model.addAttribute("google_url", url);

		/* 생성한 인증 URL을 View로 전달 */
		return "login/login_form";//jsp file name
	}//login_form
	
	
	// 구글 Callback호출 메소드
	@RequestMapping(value = "/login/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code , @RequestParam String scope ) throws IOException {
		/* google url + key값 엑세스토큰*/
		System.out.println("code =" + code);
		System.out.println("scope =" + scope);
		System.out.println("여기는 googleCallback");
		
		return "login/googleSuccess";
	}
	
	
	
	
	
	@RequestMapping( value = "/login/sign", method = RequestMethod.GET )
	public String sign( ) {
		return "login/sign";//jsp file name
	}//sign
	
	@RequestMapping( value = "/id_chk", method = RequestMethod.GET )
	public void idCheck2( String m_id, PrintWriter out ) {
		System.out.println("확인");
		int isYN = 0;
		isYN = service.idCheck2( m_id );
		out.print(isYN);
		out.close();
	}//idCheck-sign
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public void join( MemberDTO dto, PrintWriter out ) {
		int successCount = 0;
		successCount = service.join(dto);
		out.print(successCount);
		out.close();
	}//join
	
}//class

