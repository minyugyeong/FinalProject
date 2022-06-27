package com.kh.mars.rest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.BoardDto;
import com.kh.mars.repository.BoardDao;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping("/rest/board")
public class BoardRestController {
	
	@Autowired
	private BoardDao boardDao;
	
	@PostMapping("/")
	public BoardDto insert(@RequestBody BoardDto boardDto, @ApiIgnore HttpSession session) {
		Integer memberNo = (Integer)session.getAttribute("login");
		boardDto.setMemberNo(memberNo);
		
		return boardDao.insert(boardDto);
	}
	
	

}














