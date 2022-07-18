package com.kh.mars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("admin")
@Controller
public class StatusController {

	@GetMapping("/status")
	String status() {
		return "admin/status";
	}
	
}
