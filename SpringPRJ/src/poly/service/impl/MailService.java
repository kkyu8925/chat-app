package poly.service.impl;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MailDTO;
import poly.service.IMailService;
import poly.util.CmmUtil;

@Service("MailService")
public class MailService implements IMailService {

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	final String host = "smtp.naver.com"; // 네이버에서 제공하는 SMTP서버
	final String user = "";
	final String password = "";

	@Override
	public int doSendMail(MailDTO pDTO) {

		// 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + ".doSendMail start");

		// 메일 발송 성공여부(발송성공 : 1 / 발송실패 : 0)
		int res = 1;

		// 전달 받은 DTO로부터 데이터 가져오기(null 방지 if문)
		if (pDTO == null) {
			pDTO = new MailDTO();
		}

		String toMail = CmmUtil.nvl(pDTO.getToMail()); // 받는 사람

		Properties props = new Properties();
		props.put("mail.smtp.host", host); // javax 외부 라이브러리에 메일 보내는 사람의 정보 설정
		props.put("mail.smtp.auth", "true"); // javax 외부 라이브러리에 메일 보내는 사람 인증 여부 설정

		// 네이버 SMTP서버 인증 처리 로직
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));

			// 메일 제목
			message.setSubject(CmmUtil.nvl(pDTO.getTitle()));

			// 메일 내용
			message.setText(CmmUtil.nvl(pDTO.getContents()));

			// 메일 발송
			Transport.send(message);
		} catch (MessagingException e) {
			res = 0; // 메일 발송 실패 0
			log.info("[ERROR]" + this.getClass().getName() + ".doSnedMail :" + e);
		} catch (Exception e) {
			res = 0; // 메일 발송 실패 0
			log.info("[ERROR]" + this.getClass().getName() + ".doSnedMail :" + e);
		}

		// 로그 찍기
		log.info(this.getClass().getName() + ".doSendMail end!");
		return res;
	}

}