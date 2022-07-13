package com.kh.mars.repository;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface AttachDao {
	
	int save(MultipartFile attach) throws IllegalStateException, IOException;

	void delete(int profileIsNull);

}
