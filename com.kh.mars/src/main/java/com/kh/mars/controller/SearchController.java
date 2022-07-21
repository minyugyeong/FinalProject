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
import com.kh.mars.repository.HashtagDao;
import com.kh.mars.repository.MemberDao;


@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private HashtagDao hashtagDao;
	
	@GetMapping("/{hashTagNo}")
	public String searchMain(
							@PathVariable int hashTagNo,
							HttpSession session,
							Model model
							) {
		session.setAttribute("login", 203);
		int memberNo = (Integer)session.getAttribute("login");
		MemberDto memberDto = memberDao.myInfo(memberNo);
		String hashTagName = hashtagDao.hashTagName(hashTagNo);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("hashTagNo", hashTagNo);
		model.addAttribute("hashTagName", hashTagName);
		return "search/search";
	}
}
