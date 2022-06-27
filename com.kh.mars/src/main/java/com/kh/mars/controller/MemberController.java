package com.kh.mars.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	

	//회원가입 페이지
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	//로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
//	@PostMapping("/join")
//	public String join() {
//		
//	}
}
