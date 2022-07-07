package com.kh.mars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/dm")
public class DMController {
	
	@GetMapping("")
	public String chat(
						HttpSession session,
						Model model
						) {
		session.setAttribute("login", 31);//지우기
		int memberNo = (Integer) session.getAttribute("login");
		model.addAttribute("memberNo", memberNo);
		return "dm/chat";
	}
	
	 
	
}
