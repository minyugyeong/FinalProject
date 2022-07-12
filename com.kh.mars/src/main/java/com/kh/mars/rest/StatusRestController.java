package com.kh.mars.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.repository.StatusDao;
import com.kh.mars.vo.AdStatusVO;
import com.kh.mars.vo.JoinGenderVO;
import com.kh.mars.vo.MemberInterestVO;
@RequestMapping("/rest/status")
@RestController
public class StatusRestController {
	
	@Autowired
	StatusDao statusDao;
	
	@GetMapping("/")
	public List<JoinGenderVO> joinGender(){
		return statusDao.joinGender();
	}
	
	@GetMapping("/interest")
	public List<MemberInterestVO> memberInterest(){
		return statusDao.memberInterest();
	}
	@GetMapping("/maninterest")
	public List<MemberInterestVO> manInterest(){
		return statusDao.manInterest();
	}
	@GetMapping("/womeninterest")
	public List<MemberInterestVO> womanInterest(){
		return statusDao.womenInterest();
	}
	@GetMapping("/interestAd")
	public List<AdStatusVO> interestAd(){
		return statusDao.interestAd();
	}
	@GetMapping("/adsum")
	public List<AdStatusVO> adSum(){
		return statusDao.adSum();
	}
}
