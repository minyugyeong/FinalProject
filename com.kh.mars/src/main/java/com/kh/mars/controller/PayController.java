package com.kh.mars.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.mars.repository.BoardAdDao;
import com.kh.mars.vo.BoardAdAttachNoVO;


@Controller
public class PayController {
	
	
	@Autowired
	private BoardAdDao boardAdDao;
	
	@GetMapping("/member/ad")
	public String pay(@RequestParam int memberNo, Model model) {
		
		List<BoardAdAttachNoVO> list = boardAdDao.selectList(memberNo);
		model.addAttribute("list", list);
		
		return "/member/ad";
	}

}
