package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;

/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Controller
public class UserController {

	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());

	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨) static 선언 방식 기반의 싱글톤패턴
	 */
	@Resource(name = "UserService")
	private IUserService userService;

	@RequestMapping(value = "user/userLoginProc", method = RequestMethod.POST)
	public String userLoginProc(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		log.info(this.getClass().getName() + ".user/userLoginProc start");

		String user_email = CmmUtil.nvl(request.getParameter("user_email"));
		String user_pw = CmmUtil.nvl(request.getParameter("user_pw"));

		log.info("user_email : " + user_email);
		log.info("user_pw : " + user_pw);

		UserDTO pDTO = new UserDTO();
		pDTO.setUser_email(user_email);
		pDTO.setUser_pw(user_pw);

		UserDTO rDTO = userService.getUserInfo(pDTO);
		String msg;
		String url;

		if (rDTO == null) {
			msg = "로그인 실패";
			url = "/";
		} else {
			msg = "로그인 성공";
			url = "/friends.do";
			session.setAttribute("user_name", rDTO.getUser_name());
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info(this.getClass().getName() + ".user/userLoginProce end");
		return "/redirect";
	}

	@RequestMapping(value = "user/userSignin")
	public String userLogin() {
		log.info(this.getClass().getName() + ".userLogin start");
		log.info(this.getClass().getName() + ".userLogin end");
		return "/user/userSignin";
	}

	@RequestMapping(value = "/user/getUserList", method = RequestMethod.POST)
	@ResponseBody
	public List<UserDTO> getUserList(HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + "./user/getUserList start");

		List<UserDTO> rList = userService.getUserList();
		log.info("rList size : " + rList.size());

		log.info(this.getClass().getName() + ".user/userSearchList start");
		return rList;
	}
	
	@RequestMapping(value ="/user/getSearchList.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<UserDTO> getSearchList(HttpServletRequest request) throws Exception{
		
		log.info(this.getClass().getName() + ".user/getSearchList start");
		String user_name =CmmUtil.nvl(request.getParameter("name"));
		log.info("user_name : " +user_name);
		
		UserDTO uDTO =new UserDTO();
		uDTO.setUser_name(user_name);
		
		List<UserDTO> uList = userService.getSearchList(uDTO);
		log.info("uList size :"+uList.size());
		
		log.info(this.getClass().getName() + ".user/getSearchList end");
		return uList;
	}

}
