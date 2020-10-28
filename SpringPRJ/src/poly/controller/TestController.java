package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.TestDTO;
import poly.service.ITestService;

@Controller
public class TestController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="TestService")
	private ITestService testService;
	
	@RequestMapping(value="test")
	public String test(ModelMap model) {
		
		List<TestDTO> rList = testService.getList();
		
		if (rList == null) {
			rList = new ArrayList<TestDTO>();
		}
		
		model.addAttribute("rList",rList);
		
		return "/test";
	}

}
