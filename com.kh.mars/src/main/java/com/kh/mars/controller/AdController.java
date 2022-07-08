package com.kh.mars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ad")
public class AdController {
	
	@GetMapping("/")
	public String home() {
		return "/ad/admin";
	}

}
