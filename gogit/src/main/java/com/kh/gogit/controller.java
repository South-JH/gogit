package com.kh.gogit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {

	@RequestMapping("main")
	public String main() {
		return "main";
	}
	
}
