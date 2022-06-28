package com.kh.mars.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private BoardService boardService;
	
	//등록
	@GetMapping("/insert")
	public String insert() {
		return "/board/insert";
	}
	
	@PostMapping("/insert")
	public String insert(
			@ModelAttribute BoardDto boardDto, 
			HttpSession session, 
			RedirectAttributes attr,
			@RequestParam MultipartFile boardAttach) throws IllegalStateException, IOException {
		
		Integer memberNo = (Integer)session.getAttribute("login");
		boardDto.setMemberNo(memberNo);
		
		boardService.insert(boardDto, boardAttach);
		
		attr.addAttribute("memberNo", memberNo);
		
		return "redirect:/member/detail";
		
	}
	

	
	

}
