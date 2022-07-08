package com.kh.mars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdController {
	
	@GetMapping("/admin/ad")
	public String home() {
		return "/admin/ad";
	}

}
