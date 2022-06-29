package com.kh.mars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	

	//회원가입 페이지
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.join(memberDto);
		return "member/login";
	}
	
	//로그인 페이지
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String login(
			@RequestParam String memberEmail,
			@RequestParam String memberPassword,
			HttpSession session) {
		MemberDto memberDto = memberDao.login(memberEmail, memberPassword);
		
		if(memberDto != null) {
			session.setAttribute("login", memberDto.getMemberNo());
			session.setAttribute("auth", memberDto.getMemberGrade());
		}
		return "redirect:/";
	}
	
	@GetMapping("/edit")
	public String edit(HttpSession session, Model model) {
		int memberNo = (Integer)session.getAttribute("login");
		
		MemberDto memberDto = memberDao.info(memberNo);
		model.addAttribute("memberDto", memberDto);
		
		return "member/edit";
	}
	
	
}
