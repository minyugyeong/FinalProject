package com.kh.mars.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.vo.MemberVO;

@Controller
@RequestMapping("/dm")
public class DMController {
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("")
	public String chat(
						@RequestParam(required = false, defaultValue = "0") int targetNo,
						HttpSession session,
						Model model
						) {
		int memberNo = (Integer) session.getAttribute("login");
		MemberDto memberDto = memberDao.myInfo(memberNo);
		int attachNo = memberDao.memberProfile(memberNo);
		
		MemberVO targetVO = memberDao.dmMemberInfo(targetNo);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("attachNo", attachNo);
		model.addAttribute("targetVO", targetVO);
		return "dm/chat";
	}
	
	 
	
}
