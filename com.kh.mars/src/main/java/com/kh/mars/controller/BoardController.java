package com.kh.mars.controller;

import java.io.IOException;
import java.util.List;

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
import com.kh.mars.entity.BoardHashtagDto;
import com.kh.mars.entity.HashtagDto;
import com.kh.mars.repository.BoardDao;
import com.kh.mars.repository.BoardHashtagDao;
import com.kh.mars.repository.HashtagDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.repository.MemberProfileDao;
import com.kh.mars.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	@Autowired
	private HashtagDao hashtagDao;
	
	@Autowired
	private BoardHashtagDao boardHashtagDao;

	
	
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
			@RequestParam(value="boardAttach", required=false) List<MultipartFile> boardAttach,
			Model model,
			@ModelAttribute HashtagDto hashtagDto,
			@ModelAttribute BoardHashtagDto boardHashtagDto) throws IllegalStateException, IOException {
		
		Integer memberNo = (Integer)session.getAttribute("login");
		boardDto.setMemberNo(memberNo);
	
		boardService.insert(boardDto, boardAttach);
		
		
		//해시태그 저장하기
		if(hashtagDto.getHashtagName() != null) {
			
			String inputHashtagName = hashtagDto.getHashtagName();
			String[] array = inputHashtagName.split(" ");
			
			
			
			for(int i = 0; i < array.length; i++) {
				String hashtagName = array[i];
				
				HashtagDto hashtagDtoFind = hashtagDao.selectOne(hashtagName);
				if(hashtagDtoFind == null) {
					
					hashtagDto.setHashtagName(hashtagName);
					hashtagDao.insert(hashtagDto);
					
					boardHashtagDto.setBoardNo(boardDto.getBoardNo());
					boardHashtagDto.setHashtagNo(hashtagDto.getHashtagNo());
					boardHashtagDao.insert(boardHashtagDto);
				}
				else {
					boardHashtagDto.setBoardNo(boardDto.getBoardNo());
					boardHashtagDto.setHashtagNo(hashtagDtoFind.getHashtagNo());
					boardHashtagDao.insert(boardHashtagDto);
				}
				
			}
			
		}
		
		
		
		attr.addAttribute("memberNo", memberNo);
		
		return "redirect:/member/detail";
		
	}

}











