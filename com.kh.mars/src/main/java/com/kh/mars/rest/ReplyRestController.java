package com.kh.mars.rest;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.ReplyDto;
import com.kh.mars.error.CannotFindException;
import com.kh.mars.repository.ReplyDao;
import com.kh.mars.service.ReplyService;

@RestController
@RequestMapping("/rest/reply")
public class ReplyRestController {

	@Autowired
	public ReplyService replyService;
	@Autowired
	public ReplyDao replyDao;
	
	@PostMapping("/insert")
	public void replyInsert(
							@ModelAttribute ReplyDto replyDto,
							@RequestParam int boardNo,
							@RequestParam int superNo,
							HttpSession session
							) {
		System.out.println("replyDto = " + replyDto);
		replyDto.setReplyMemberNo((Integer)session.getAttribute("login"));
		replyDto.setSuperNo(superNo);
		replyService.insert(boardNo, replyDto);
	}
	
	@PostMapping("/insert_ad")
	public void adReplyInsert(
							@ModelAttribute ReplyDto replyDto,
							@RequestParam int boardNo,
							@RequestParam int superNo,
							HttpSession session
							) {
		System.out.println("replyDto = " + replyDto);
		replyDto.setReplyMemberNo((Integer)session.getAttribute("login"));
		replyDto.setSuperNo(superNo);
		replyService.insertAd(boardNo, replyDto);
	}
	
	@DeleteMapping("/delete/{replyNo}")
	public void delete(
						@PathVariable int replyNo,
						HttpSession session
					) {
		boolean delete = replyDao.delete(replyNo);
		if(!delete) throw new CannotFindException();
	}
	
}
