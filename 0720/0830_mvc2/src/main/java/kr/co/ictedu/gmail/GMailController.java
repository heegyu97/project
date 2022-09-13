package kr.co.ictedu.gmail;

import java.io.PrintWriter;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ictedu.util.dto.MemberDTO;

@Controller
@RequestMapping(value = "/gmail")
public class GMailController {

	private static final Logger logger = LoggerFactory.getLogger(GMailController.class);

	@Autowired
	private GMailService service;

	
	
	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public void gMailSend(PrintWriter out, String m_email) {

		//인증키
		String resultOfGMailSend = "";
		System.out.println(m_email);
		try {
			resultOfGMailSend = service.gMailSend(m_email);
		} catch( MessagingException e ) {
			logger.info("메일 전송 에러 start ==========");
			e.printStackTrace();
			logger.info("메일 전송 에러 end ==========");
			resultOfGMailSend = "메일 발송이 실패 하였습니다.";
		}
		//스프링 메일 전송 끝 resultOfGMailSend : 인증코드
		System.out.println(resultOfGMailSend);
		out.print(resultOfGMailSend);
		out.close();
	}//gMailSend

}//class
