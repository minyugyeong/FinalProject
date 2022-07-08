package com.kh.mars.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.AdDto;
import com.kh.mars.repository.AdDao;

@RestController
@RequestMapping("/rest/ad")
public class AdRestController {
	
	@Autowired
	private AdDao adDao;
	
	
	//목록
	@GetMapping("/")
	public List<AdDto> list(){
		
		return adDao.selectListOrderbyNo();
	}
	
	@PostMapping("/")
	//등록
	public AdDto insert(@RequestBody AdDto adDto) {
		
		return adDao.insert(adDto);
	}
	
	@PutMapping("/")
	//수정
	public AdDto update(@RequestBody AdDto adDto) {
		
		return adDao.update(adDto);
	}
	
	//삭제
	@DeleteMapping("/{adNo}")
	public void delete(@PathVariable int adNo) {
		
		adDao.delete(adNo);
	}

}









