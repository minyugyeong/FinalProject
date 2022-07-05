package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.AdDto;

public interface AdDao {

	List<AdDto> selectList();

}
