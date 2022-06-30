package com.kh.mars.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("first")
	public String first() {
		return "/admin/first";
	}
}
