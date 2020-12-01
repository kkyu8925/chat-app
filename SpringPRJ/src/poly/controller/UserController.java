package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import poly.util.EncryptUtil;

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
	
	/**
	 * 로그인 처리 및 결과 알려주는 화면으로 이동
	 * 구글 auth
	 */
	@RequestMapping(value = "user/usergauthProc.do",method = RequestMethod.POST)
	public String usergauthProc(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		String msg = "gauth 실패.";
		String url ="/";
		
		UserDTO pDTO = null;
		UserDTO rDTO;
		
		try {
			//가져오기
			String user_email = CmmUtil.nvl(request.getParameter("user_email")); // 이메일
			String user_pw = CmmUtil.nvl(request.getParameter("user_pw")); // 비밀번호
			String user_id = CmmUtil.nvl(request.getParameter("user_id")); // 아이디
			String user_name = CmmUtil.nvl(request.getParameter("user_name")); // 이름
			String user_Image = CmmUtil.nvl(request.getParameter("user_Image")); // 이미지 
			String user_isGUser = CmmUtil.nvl(request.getParameter("user_isGUser")); // Oauth 
			
			log.info("user_name : " +user_name);
			log.info("user_email : " +user_email);
			log.info("user_pw : " + user_pw);
			
			//이메일, 모조비번 저장 (나머지 속성은 DTO속성을 추가해야함)
			pDTO = new UserDTO();
			pDTO.setUser_name(user_name);
			pDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));
			pDTO.setUser_pw(EncryptUtil.encHashSHA256(user_pw));
			
			
			//서버에 저장 (gauth 사용시 권장되지 않음)
			int res = userService.insertUserInfo(pDTO); //서비스에서 중복 거르므로 if문 작성 안함
			msg="gauth 가입 성공!";
			
			//유저 조회
			rDTO = userService.getUserInfo(pDTO);
			
			if (rDTO != null) { // 로그인 성공(일반 로그인 가능하므로, DTO에 isgauth 속성 넣을 것 -> getuser_isgauth로 조회)
				session.setAttribute("SS_USER_NAME", rDTO.getUser_name()); 
				session.setAttribute("SS_USER_NO", rDTO.getUser_no());
				
				// 결과 메세지 전달하기
				msg="gauth 로그인 성공";
				url="/friends.do";
			}
			
		} catch (Exception e) {
			
			log.info(e.toString());
			e.printStackTrace();
			msg="로그인 실패 - 시스템 에러";
			
		} finally {
			
			log.info(this.getClass().getName() + ".user/usergauthProc.do 끝!");
			
			// 결과 메세지 전달하기
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			model.addAttribute("pDTO", pDTO);
			pDTO = null;
		}
		return "/redirect";
	}

	/**
	 * 로그인 처리 및 결과 알려주는 화면으로 이동
	 */
	@RequestMapping(value = "user/userLoginProc.do",method = RequestMethod.POST)
	public String userLoginProc(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info(this.getClass().getName() + ".user/userLoginProc.do start");

		// 웹(회원정보 입력화면)으로 부터 받은 정보를 저장할 변수
		UserDTO pDTO = null;
		
		String msg = "로그인 실패 - 아이디와 비밀번호를 확인해주세요.";
		String url ="/";
		
		UserDTO rDTO;

		try {
			
			String user_email = CmmUtil.nvl(request.getParameter("user_email")); // 이메일
			String user_pw = CmmUtil.nvl(request.getParameter("user_pw")); // 비밀번호

			log.info("user_email : " +user_email);
			log.info("user_pw : " + user_pw);

			// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수를 메모리에 올리기
			pDTO = new UserDTO();

			// 민감 정보인 이메일은 AES128-CBC로 암호화함
			pDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));

			// 비밀번호는 절대로 복호화되지 않도록 해시 알고리즘으로 암호화
			pDTO.setUser_pw(EncryptUtil.encHashSHA256(user_pw));
			
			// 로그인
			rDTO = userService.getUserInfo(pDTO); 

			if (rDTO != null) { // 로그인 성공
				
				session.setAttribute("SS_USER_NAME", rDTO.getUser_name()); // SS 유저이름
				session.setAttribute("SS_USER_NO", rDTO.getUser_no()); // SS 유저 번호
				
				// 결과 메세지 전달하기
				msg="로그인 성공";
				url="/friends.do";
			}
			
		} catch (Exception e) {
			
			// 저장이 실패시, 사용자에게 보여줄 메세지
			log.info(e.toString());
			e.printStackTrace();
			msg="로그인 실패 - 시스템 에러";
			
		} finally {
			
			log.info(this.getClass().getName() + ".user/userLoginProc.do end");
			
			// 결과 메세지 전달하기
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);

			// 변수 초기화
			pDTO = null;
		}
		
		return "/redirect";
	}
	
	/**
	 * 회원 가입 화면으로 이동
	 */
	@RequestMapping(value = "user/userSignin")
	public String userLogin() {
		log.info(this.getClass().getName() + ".userLogin start");
		log.info(this.getClass().getName() + ".userLogin end");
		return "/user/userSignin";
	}
	
	/**
	 * 유저리스트 가져오기 ajax
	 */
	@RequestMapping(value = "/user/getUserList", method = RequestMethod.POST)
	@ResponseBody
	public List<UserDTO> getUserList(HttpServletRequest request) throws Exception {

		log.info(this.getClass().getName() + "./user/getUserList start");
		
		// 유저 리스트 가져오기
		List<UserDTO> rList = userService.getUserList(); 
		log.info("rList size : " + rList.size());

		log.info(this.getClass().getName() + ".user/getUserList end");
		return rList;
	}
	
	/**
	 * 서칭 유저리스트 가져오기 ajax
	 */
	@RequestMapping(value ="/user/getSearchList.do", method=RequestMethod.POST) 
	@ResponseBody
	public List<UserDTO> getSearchList(HttpServletRequest request) throws Exception{
		
		log.info(this.getClass().getName() + ".user/getSearchList start");
		
		String user_name =CmmUtil.nvl(request.getParameter("name")); // 이름
		log.info("user_name : " +user_name);
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_name(user_name);
		
		// 서칭 유저리스트 가져오기
		List<UserDTO> uList = userService.getSearchList(uDTO);
		log.info("uList size :"+uList.size());
		
		log.info(this.getClass().getName() + ".user/getSearchList end");
		return uList;
	}
	
	/**
	 *  이메일 중복 확인 ajax
	 */
	@RequestMapping(value ="emailCheckForAjax.do", method=RequestMethod.POST)
	@ResponseBody
	public String emailCheckForAjax(HttpServletRequest request) throws Exception{
		
		log.info(this.getClass().getName() + ".emailCheckForAjax start");
		
		String user_email =CmmUtil.nvl(request.getParameter("user_email")); // 이메일
		log.info("user_email : " +user_email);
		
		UserDTO pDTO =new UserDTO();
		String msg= null;
		
		// 민감 정보인 이메일은 AES128-CBC로 암호화함
		pDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));
		
		// 이메일 중복 확인
		UserDTO rDTO = userService.emailCheckForAjax(pDTO);
		
		if(rDTO == null) {
			msg = "1"; // 이메일 중복 없음
		} else {
			msg = "0"; // 이메일 중복 있음
		}
		
		log.info(this.getClass().getName() + ".emailCheckForAjax end");
		return msg;
	}
	
	/**
	 * 로그아웃 진행
	 */
	@RequestMapping(value = "user/userLogOut")
	public String logOut(HttpSession session, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".user/logOut start");
		
		// session을 비움
		session.removeAttribute("SS_USER_NAME");
		session.removeAttribute("SS_USER_NO");
		
		// 결과 메세지 전달하기
		model.addAttribute("msg", "로그아웃 성공");
		model.addAttribute("url", "/");

		log.info(this.getClass().getName() + ".user/logOut end");
		return "/redirect";
	}
	
	/**
	 * 회원가입 로직 처리
	 */
	@RequestMapping(value = "user/insertUserInfo", method = RequestMethod.POST)
	public String insertUserInfo(HttpServletRequest request, HttpServletResponse respose, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + ".insertUserInfo start");

		// 회원가입 결과에 대한 메세지를 전달할 변수
		String msg = "";

		// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수
		UserDTO pDTO = null;

		try {

			String user_email = CmmUtil.nvl(request.getParameter("user_email")); // 이메일
			String user_name = CmmUtil.nvl(request.getParameter("user_name")); // 이름
			String user_pw = CmmUtil.nvl(request.getParameter("user_pw")); // 비밀번호

			log.info("user_email : " + user_email);
			log.info("user_name : " + user_name);
			log.info("user_pw : " + user_pw);

			// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수를 메모리에 올리기
			pDTO = new UserDTO();
			pDTO.setUser_name(user_name);

			// 비밀번호는 절대로 복호화되지 않도록 해시 알고리즘으로 암호화
			pDTO.setUser_pw(EncryptUtil.encHashSHA256(user_pw));

			// 민감 정보인 이메일은 AES128-CBC로 암호화함
			pDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));

			// 회원가입
			int res = userService.insertUserInfo(pDTO);

			if (res == 1) {
				msg = "회원가입되었습니다.";
			} else if (res == 2) {
				msg = "이미 가입된 이메일 주소입니다.";
			} else {
				msg = "오류로 인해 회원가입이 실패하였습니다.";
			}

		} catch (Exception e) {
			// 예외로 실패시
			msg = "실패하였습니다" + e.toString();
			log.info(e.toString());
			e.printStackTrace();

		} finally {

			log.info(this.getClass().getName() + ".insertUserInfo end!");

			// 결과 메세지 전달하기
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/");

			// 데이터 전달하기
			model.addAttribute("pDTO", pDTO);
			
			// 변수 초기화
			pDTO = null;
		}
		return "/redirect";
	}
	
	@RequestMapping(value="user/findPasswordProc", method = RequestMethod.POST)
	public String findPasswordProc(HttpServletRequest request, ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".user.findPasswordProc start");

		// 회원가입 결과에 대한 메세지를 전달할 변수
		String msg = "";

		// 웹(회원정보 입력화면)에서 받는 정보를 저장할 변수
		UserDTO pDTO = null;
		
		try {
			
			String user_email = CmmUtil.nvl(request.getParameter("user_email")); // 이메일
			String user_name = CmmUtil.nvl(request.getParameter("user_name")); // 이름
			
			log.info("user_email : " + user_email);
			log.info("user_name : " + user_name);
			
			pDTO = new UserDTO();
			
			pDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));
			pDTO.setUser_name(user_name);
			
			int res = userService.findPasswordProc(pDTO);
			
			if (res == 1) {
				msg = "이메일을 전송하였습니다. 메일을 확인해 주세요.";
			} else if (res == 2) {
				msg = "이메일과 이름을 다시 확인해 주세요.";
			} else {
				msg = "오류로 인해 실패하였습니다.";
			}
			
		}catch(Exception e) {
			// 예외로 실패시
			msg = "실패하였습니다."+e.toString();
			log.info(e.toString());
			e.printStackTrace();
		} finally {
			
			log.info(this.getClass().getName() + ".user.findPasswordProc end");
			
			// 결과 메세지 전달하기
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/");

			// 웹(회원정보 입력화면)으로부터 입력받은 데이터 전달하기
			model.addAttribute("pDTO", pDTO);

			pDTO = null;
		}
		return "/redirect";
	}
	
	@RequestMapping(value = "user/chgNameProc.do",method = RequestMethod.POST)
	public String chgNameProc(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".user/chgNameProc start");
		
		UserDTO pDTO = null;
		log.info("DTO init 성공!");
		
		//유저 정보 가져오기
		String user_no = (String) session.getAttribute("SS_USER_NO");
		log.info("user_no : " + user_no + ", 세션 변환 성공! ");
		
		//수정 이름 가져오기
		String user_name = CmmUtil.nvl(request.getParameter("user_name"));
		log.info("user_name : " + user_name + ", 수정 이름!!! ");
		
		// 전달
		pDTO = new UserDTO();
		pDTO.setUser_no(user_no);
		log.info("user_no 넣기 성공!");
		pDTO.setUser_name(user_name);
		log.info("user_name 넣기 성공!");
		userService.chgNameProc(pDTO);
		log.info("userService로 전달 성공!");
		
		session.setAttribute("SS_USER_NAME", user_name);
		
		model.addAttribute("msg", "이름변경 성공");
		model.addAttribute("url", "/user/account.do");

		log.info(this.getClass().getName() + ".user/chgNameProc end");
		return "/redirect";
	}
	
	@RequestMapping(value = "user/chgPWProc.do",method = RequestMethod.POST)
	public String chgPWProc(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {
		log.info(this.getClass().getName() + ".user/chgPWProc start");

		UserDTO pDTO = null;
		log.info("DTO init 성공!");

		//유저 정보 가져오기
		String user_no = (String) session.getAttribute("SS_USER_NO");
		log.info("user_no : " + user_no + ", 세션 변환 성공! ");

		//수정 이름 가져오기
		String user_pw = CmmUtil.nvl(request.getParameter("user_pw"));
		log.info("user_pw : " + user_pw + ", 수정 이름!!! ");

		// 전달
		pDTO = new UserDTO();
		pDTO.setUser_no(user_no);
		log.info("user_no 넣기 성공!");
		pDTO.setUser_pw(EncryptUtil.encHashSHA256(user_pw));
		log.info("user_name 넣기 성공!");
		userService.chgPWProc(pDTO);
		log.info("userService로 전달 성공!");

		model.addAttribute("msg", "비밀번호 변경 성공");
		model.addAttribute("url", "/");

		log.info(this.getClass().getName() + ".user/chgPWProc end");
		return "/redirect";
	}

}
