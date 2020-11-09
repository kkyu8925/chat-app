package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.MailDTO;
import poly.service.IMailService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class MailController {

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨) static 선언 방식 기반의 싱글톤패턴
	 */
	@Resource(name = "MailService")
	private IMailService mailService;

	/**
	 * 메일 발송하기
	 */
	@RequestMapping(value = "mail/sendMail", method = RequestMethod.POST)
	public String sendMail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

		// 로그 찍기
		log.info(this.getClass().getName() + ".mail/sendMail start");

		// 웹 url으로부터 전달받은 값들
		String toMail = CmmUtil.nvl(request.getParameter("toMail")); // 받는 사람
		String title = CmmUtil.nvl(request.getParameter("title")); // 제목
		String contents = CmmUtil.nvl(request.getParameter("contents")); // 내용

		// 메일 발송할 정보 넣기 위한 MailDTO 생성
		MailDTO pDTO = new MailDTO();

		// 웹에서 받은 값 DTO 넣기
		pDTO.setToMail(toMail); // 받는 사람을 DTO 저장
		pDTO.setTitle(title); // 제목을 DTO 저장
		pDTO.setContents(contents); // 내용을 DTO 저장

		// 메일발송하기
		int res = mailService.doSendMail(pDTO);

		if (res == 1) { // 메일발송 성공
			log.info(this.getClass().getName() + ".mail/sendMail success");
		} else { // 메일발송 실패
			log.info(this.getClass().getName() + ".mail/sendMail fail");
		}

		// 메일 발송 결과를 JSP에 전달하기(데이터 전달시, 숫자보단 문자열이 컨트롤하기 편하기 때문에 형변환)
		model.addAttribute("res", String.valueOf(res));

		// 로그 찍기
		log.info(this.getClass().getName() + ".mail/sendMail end");

		// 함수 끝나고 보여줄 JSP파일
		return "/mail/sendMailResult";
	}

	@RequestMapping(value = "mail/mailForm")
	public String mailForm() {
		log.info(this.getClass().getName() + ".mail/mailForm start");
		log.info(this.getClass().getName() + ".mail/mailForm end");
		return "/mail/mailForm";
	}

}