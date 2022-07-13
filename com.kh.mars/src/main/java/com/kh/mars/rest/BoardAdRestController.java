package com.kh.mars.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.BoardAdDto;
import com.kh.mars.repository.BoardAdDao;

@RestController
@RequestMapping("/rest")
public class BoardAdRestController {
	
	@Autowired
	private BoardAdDao boardAdDao;
	
	
	@PutMapping("/admin/boardAdList")
	public BoardAdDto update(@RequestBody BoardAdDto boardAdDto) {
		
		return boardAdDao.update(boardAdDto);
	}

}
