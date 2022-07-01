package com.kh.mars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dm")
public class DMController {
	
	@GetMapping("")
	public String channel(@RequestParam int no, Model model) {
		model.addAttribute("no", no);
		return "dm/channel";
	}
	
}
