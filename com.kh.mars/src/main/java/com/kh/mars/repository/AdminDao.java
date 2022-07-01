package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.MemberDto;

public interface AdminDao {
	
	List<MemberDto> list();
}
