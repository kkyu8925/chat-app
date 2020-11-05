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


@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value="index")
	public String Index(HttpSession session) throws Exception {
		log.info(this.getClass());
		
		// session을 비움
		session.invalidate();
		
		return "/index";
	}
	
	@RequestMapping(value="friends")
	public String friends(ModelMap model) throws Exception {
		log.info(this.getClass().getName()+".frieends start");
		
		// 리스트 가져오기
		List<UserDTO> rList = userService.getUserList(); 
		log.info(rList);
		
		if(rList==null) {
			rList = new ArrayList<UserDTO>(); 
		}
		
		model.addAttribute("rList",rList);
		
		rList =null;
		
		log.info(this.getClass().getName()+".friedns end");
		
		return "/friends";
	}
	
	@RequestMapping(value="chat")
	public String chat() throws Exception {
		log.info(this.getClass());
		
		return "/chat";
	}
	
	@RequestMapping(value="settings")
	public String settings() throws Exception {
		log.info(this.getClass());
		
		return "/settings";
	}

	@RequestMapping(value="find")
	public String find() throws Exception {
		log.info(this.getClass());
		
		return "/find";
	}
	
			
}
