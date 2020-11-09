package poly.service;

import poly.dto.MailDTO;

public interface IMailService {

	// 메일 발송
	int doSendMail(MailDTO pDTO);

}