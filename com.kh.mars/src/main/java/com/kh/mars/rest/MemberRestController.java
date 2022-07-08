package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mars.entity.CertDto;
import com.kh.mars.entity.MemberDto;
import com.kh.mars.repository.CertDao;
import com.kh.mars.repository.FollowDao;
import com.kh.mars.repository.MemberDao;
import com.kh.mars.service.EmailService;
import com.kh.mars.service.FollowService;
import com.kh.mars.vo.FollowVO;
import com.kh.mars.vo.FollowerVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@CrossOrigin(origins = "http://127.0.0.1:5500")
public class MemberRestController {
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private CertDao certDao;
	
	@Autowired
	private FollowDao followDao;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private MemberDao memberDao;
	
	
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
	
	@GetMapping("/followList")
	@ResponseBody
	public List<FollowVO> followList(@RequestParam int memberNo) {
		return followDao.followList(memberNo);
	}
	
	@GetMapping("/followerList")
	@ResponseBody
	public List<FollowerVO> followerList(@RequestParam int memberNo){
		return followDao.followerList(memberNo);
	}
	
	@PostMapping("/follow")
	@ResponseBody
	public int follow(@RequestParam int memberNo,
			HttpSession session) {
		int followWho = (Integer) session.getAttribute("login");
		
		//비공개 계정일 경우
		MemberDto memberDto = memberDao.info(memberNo);
		
		
		if(memberDto.getMemberPrivate() == 1) {//비공개 계정일 경우
			int followConfirm = 0;
			if(followService.follow(followWho, memberNo, followConfirm) > 0) {
				return -1;
			}else {
				return 0;
			}
			
		}
		else {//공개 계정일 경우			
			int followConfirm = 1;
			return followService.follow(followWho, memberNo, followConfirm);
		}
		
		
	}
	
	@GetMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmail(@RequestParam String memberEmail) {
		String checkEmail = memberDao.checkEmail(memberEmail);
		
		if(checkEmail != null) {
			return true;
		}
		else{
			return false;
		}
	}
	
	@PostMapping("/deleteFollower")
	@ResponseBody
	public int deleteFollower(@RequestParam int memberNo, HttpSession session) {
		int followWho = (Integer) session.getAttribute("login");
		followDao.followDelete(followWho, memberNo);
		
		return followWho;
	}
	
}










