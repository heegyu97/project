package kr.co.ictedu.gmail;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/gmail")
public class GMailController {

	private static final Logger logger = LoggerFactory.getLogger(GMailController.class);

	@Autowired
	private GMailService service;

	@RequestMapping(value = "/send", method = RequestMethod.GET)
	public String gMailSend(Model model) {

		String resultOfGMailSend = "";

		try {
			resultOfGMailSend = service.gMailSend();
		} catch( MessagingException e ) {
			logger.info("메일 전송 에러 start ==========");
			e.printStackTrace();
			logger.info("메일 전송 에러 end ==========");
			resultOfGMailSend = "메일 발송이 실패 하였습니다.";
		}
		//스프링 메일 전송 끝

		model.addAttribute("resultOfGMailSend", resultOfGMailSend);

		return "gmail/send_result";//jsp file name
	}//gMailSend

}//class
