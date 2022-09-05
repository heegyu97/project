package kr.co.ictedu.gmail;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class GMailService {

	@Autowired
	private JavaMailSender mailSender;

	public String gMailSend() throws MessagingException {

		//임시 비번 만들기 시작
		String [] upperCase = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"
				, "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T"
				, "U", "V", "W", "X", "Y", "Z"};//26개
		String [] lowerCase = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j"
				, "k", "l", "m", "n", "o", "p", "q", "r", "s", "t"
				, "u", "v", "w", "x", "y", "z"};//26개//소문자 변경 : crtl + shift + y
		String [] specialCase = {"~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")"};//11개

		String tmpPwd = "";
		for(int i = 1; i <= 3; i++) {
			tmpPwd = tmpPwd + upperCase[ (int)(Math.random() * 26) ];
			tmpPwd = tmpPwd + (int)(Math.random() * 10);
			tmpPwd = tmpPwd + specialCase[ (int)(Math.random() * 11) ];
			tmpPwd = tmpPwd + lowerCase[ (int)(Math.random() * 26) ];
		}//for - 3번 수행 => 임시비번은 12자
		//임시 비번 만들기 끝

		//스프링 메일 전송 시작
		String setFrom = "YOUR_MAIL@gmail.com";//보내는 사람 이메일 주소
		String toMail = "YOUR_ANOTHER_MAIL";//받는 사람 이메일 주소
		String mailTitle = "[ictedu]임시 비번";//메일 제목
		String contents = tmpPwd;

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

		messageHelper.setFrom(setFrom);
		messageHelper.setTo(toMail);
		messageHelper.setSubject(mailTitle);
		messageHelper.setText(contents);

		//mailSender.send(message);//보낼 때 주석 풀고, root-context에 비번 설정할 것.

		return toMail + "으로 메일이 발송 되었습니다.";

	}//gMailSend

}//class
