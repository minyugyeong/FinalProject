package com.kh.mars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("admin")
@Controller
public class StatusController {

	@GetMapping("/memberstatus")
	String status() {
		return "admin/memberstatus";
	}
	
	@GetMapping("/adstatus")
	String adstatus() {
		return "admin/adstatus";
	}
}
