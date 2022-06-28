package com.kh.mars.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mars.entity.CertDto;
import com.kh.mars.repository.CertDao;
import com.kh.mars.service.EmailService;

@Controller
public class MemberRestController {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CertDao certDao;
	
	@PostMapping("/sendMail")
	@ResponseBody
	public void send(@RequestParam String memberEmail) {
		emailService.sendCert(memberEmail);
	}
	
	@PostMapping("/certCheck")
	@ResponseBody
	public boolean check(@ModelAttribute CertDto certDto) {
		return certDao.check(certDto);
	}
}
