package com.kh.mars.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.repository.MemberProfileDao;
import com.kh.mars.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberProfileDao memberProfileDao;
	
	//등록
	@GetMapping("/insert")
	public String insert(HttpSession session, Model model) {
		
		Integer memberNo = (Integer)session.getAttribute("login");
		
		String memberNick = memberDao.nick(memberNo);
		Integer attachNo = memberProfileDao.selectAttachNo(memberNo);
		
		model.addAttribute("memberNick", memberNick);
		model.addAttribute("attachNo", attachNo);
		 
		return "/board/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BoardDto boardDto, 
			HttpSession session, 
			RedirectAttributes attr,
			@RequestParam(value="boardAttach") List<MultipartFile> boardAttach,
			Model model) throws IllegalStateException, IOException {
		
		Integer memberNo = (Integer)session.getAttribute("login");
		boardDto.setMemberNo(memberNo);
	
			boardService.insert(boardDto, boardAttach);
		
		attr.addAttribute("memberNo", memberNo);
		
		return "redirect:/member/detail";
		
	}

}











