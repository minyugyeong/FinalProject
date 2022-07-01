package com.kh.mars.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.AdminDao;

@RestController
@RequestMapping("/rest/admin")
public class AdminRestController {
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/")
	public List<MemberDto> lit(){
		return adminDao.list();
	}
}
