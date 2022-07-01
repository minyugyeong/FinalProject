package com.kh.mars.repository;

import com.kh.mars.entity.HashtagDto;

public interface HashtagDao {

	void insert(HashtagDto hashtagDto);

	HashtagDto selectOne(String hashtagName);

}
