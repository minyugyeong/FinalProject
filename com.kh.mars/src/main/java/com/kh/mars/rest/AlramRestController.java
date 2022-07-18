package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.service.AlramService;
import com.kh.mars.vo.AlramVO;

@RestController
@RequestMapping("/rest/alram")
public class AlramRestController {

	@Autowired
	private AlramService alramService;
	
	@GetMapping("")
	public List<AlramVO> selectList(
									HttpSession session){
		int memberNo = (Integer) session.getAttribute("login");
		return alramService.selectAlram(memberNo);
	}
}
