package com.kh.mars.repository;

import com.kh.mars.entity.CertDto;

public interface CertDao {

	void insert(CertDto certDto);

	boolean check(CertDto certDto);

}
