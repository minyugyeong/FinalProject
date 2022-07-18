package com.kh.mars.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.repository.StatusDao;
import com.kh.mars.vo.JoinGenderVO;
import com.kh.mars.vo.StatusVO;
@RequestMapping("/rest/status")
@RestController
public class StatusRestController {
	
	@Autowired
	StatusDao statusDao;
	
	@GetMapping("/")
	public List<JoinGenderVO> joinGender(){
		return statusDao.joinGender();
	}
	
	@GetMapping("/genderInterest")
	public List<StatusVO> memberInterest(){
		return statusDao.memberInterest();
	}
	@GetMapping("/manInterest")
	public List<StatusVO> manInterest(){
		return statusDao.manInterest();
	}
	@GetMapping("/womanInterest")
	public List<StatusVO> womanInterest(){
		return statusDao.womenInterest();
	}
	@GetMapping("/adInterest")
	public List<StatusVO> interestAd(){
		return statusDao.interestAd();
	}
	@GetMapping("/adSales")
	public List<StatusVO> adSum(){
		return statusDao.adSum();
	}
	
	@GetMapping("/yearSales")
	public List<StatusVO> yearSales(){
		return statusDao.yearSales();
	}
	
	@GetMapping("/monthSales")
	public List<StatusVO> monthSales(int year){
		return statusDao.monthSales(year);
	}

}














