package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.UserDTO;
import poly.service.IUserService;
import poly.util.CmmUtil;


@Controller
public class MainController {
	
	// 로그 파일 생성 및 로그 출력을 위한 log4j 프레임워크의 자바 객체
	private Logger log = Logger.getLogger(this.getClass());
	
	// 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨) static 선언 방식 기반의 싱글톤패턴
	@Resource(name="UserService")
	private IUserService userService;
	
	/**
	 * 로그인 페이지 
	 * 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="index")
	public String Index(HttpSession session) throws Exception {
		
		log.info(this.getClass());
		
		return "/index";
	}
	
	/**
	 * 친구 목록 페이지
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="friends")
	public String friends(ModelMap model) throws Exception {
		
		log.info(this.getClass().getName()+".frieends start");
		
		// 리스트 가져오기
		List<UserDTO> rList = userService.getUserList(); 
		log.info(rList);
		
		if(rList==null) {
			rList = new ArrayList<UserDTO>(); 
		}
		
		// 데이터 전달하기
		model.addAttribute("rList",rList);
		
		// 초기화
		rList =null;
		
		log.info(this.getClass().getName()+".friedns end");
		
		return "/friends";
	}
	
	/**
	 * 설정 페이지
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="settings")
	public String settings() throws Exception {
		
		log.info(this.getClass());
		
		return "/settings";
	}
	
	/* 제작 이준우  공지사항 게시판 리스트 불러오기*/
	@RequestMapping(value="notice")
	public String notice() throws Exception {
		
		log.info(this.getClass());
		
		
		return "/notice";
	}
	
	/**
	 * 비밀번호 찾기
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="findPW")
	public String findPW() throws Exception {
		log.info(this.getClass());
		
		return "/user/findPW";
	}
	
	/**
	 * 개인 정보 페이지
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="user/account")
	public String account(HttpSession session,ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".user/account start");
		
		String user_no = CmmUtil.nvl((String)session.getAttribute("SS_USER_NO"));
		log.info("user_no : "+user_no);
		
		UserDTO pDTO = new UserDTO();
		pDTO.setUser_no(user_no);
		
		// 유저번호로 유저정보 가져오기
		UserDTO rDTO = userService.getUserInfoforNo(pDTO);
		
		if(rDTO == null) {
			rDTO = new UserDTO();
		}
		
		// 데이터 전달하기
		model.addAttribute("rDTO",rDTO);
		
		log.info(this.getClass().getName() + ".user/account end");
		
		return "/user/account";
	}
	
	/**
	 * 이름 변경 페이지
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="user/chgName")
	public String chgName() throws Exception {
		log.info(this.getClass());
		
		return "/user/chgName";
	}
	
	/**
	 * 비밀번호 변경 페이지
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="user/chgPW")
	public String chgPW() throws Exception {
		log.info(this.getClass());
		
		return "/user/chgPW";
	}
	
	/**
	 * 채팅방 페이지 
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="chats")
	public String chats() throws Exception {
		log.info(this.getClass());
		
		return "/chats";
	}
}
