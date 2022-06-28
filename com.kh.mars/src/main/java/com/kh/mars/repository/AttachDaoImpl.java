package com.kh.mars.repository;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mars.entity.AttachDto;

@Repository
public class AttachDaoImpl implements AttachDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//저장 위치
	private File directory = new File(System.getProperty("user.home") + "/upload");
	public AttachDaoImpl() {
		directory.mkdirs();
	}

	@Override
	public int save(MultipartFile attach) throws IllegalStateException, IOException {
		
		int attachNo = sqlSession.selectOne("attach.sequence");
		
		String fileName = String.valueOf(attachNo);
		File target = new File(directory, fileName);
		attach.transferTo(target);
		
		sqlSession.insert("attach.insert", AttachDto.builder()
														.attachNo(attachNo)
														.attachUploadName(attach.getOriginalFilename())
														.attachType(attach.getContentType())
														.attachSize(attach.getSize())
													.build());
		
		return attachNo;
	}

}







