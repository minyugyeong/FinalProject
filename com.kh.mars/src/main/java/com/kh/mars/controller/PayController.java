package com.kh.mars.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mars.entity.BoardAdAttachDto;
import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.repository.BoardAdAttachDao;
import com.kh.mars.repository.BoardAdDao;


@Controller
public class PayController {
	
	@Autowired
	private BoardAdDao boardAdDao;
	
	@Autowired
	private BoardAdAttachDao boardAdAttachDao;
	
	@GetMapping("/member/ad")
	public String pay(@RequestParam int memberNo, Model model) {
		
		List<BoardAdDto> list = boardAdDao.selectList(memberNo);
		model.addAttribute("list", list);
		
//		List<BoardAdAttachDto> listAttach = boardAdAttachDao.selectList();
//		model.addAttribute("listAttach", listAttach);
		
		return "/member/ad";
	}

}
