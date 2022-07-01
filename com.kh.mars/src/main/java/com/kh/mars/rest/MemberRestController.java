package com.kh.mars.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mars.entity.CertDto;
import com.kh.mars.repository.CertDao;
import com.kh.mars.repository.FollowDao;
import com.kh.mars.service.EmailService;
import com.kh.mars.vo.FollowVO;
import com.kh.mars.vo.FollowerVO;

@Controller
@CrossOrigin(origins = "http://127.0.0.1:5500")
public class MemberRestController {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CertDao certDao;
	
	@Autowired
	private FollowDao followDao;
	
	
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
	
	@GetMapping("/follow")
	@ResponseBody
	public List<FollowVO> follow(@RequestParam int memberNo) {
		return followDao.followList(memberNo);
	}
	
	@GetMapping("/follower")
	@ResponseBody
	public List<FollowerVO> follower(@RequestParam int memberNo){
		return followDao.followerList(memberNo);
	}
	
}
