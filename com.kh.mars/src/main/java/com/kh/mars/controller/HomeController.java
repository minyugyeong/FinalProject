package com.kh.mars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.MemberDao;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping("/")
	public String home(
						Model model,
						HttpSession session
						) {
		session.setAttribute("login", 202);
		int memberNo = (Integer)session.getAttribute("login");
		MemberDto memberDto = memberDao.myInfo(memberNo);
		int attachNo = memberDao.memberProfile(memberNo);
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("memberProfile", attachNo);
		return "home";
	}

}
