package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="index")
	public String Index() {
		log.info(this.getClass());
		
		return "/index";
	}
	
	@RequestMapping(value="friends")
	public String friends() {
		log.info(this.getClass());
		
		return "/friends";
	}
	
	@RequestMapping(value="chat")
	public String chat() {
		log.info(this.getClass());
		
		return "/chat";
	}
	
	@RequestMapping(value="settings")
	public String settings() {
		log.info(this.getClass());
		
		return "/settings";
	}
	
	
			
}
