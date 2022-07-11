package com.kh.mars.repository;

import com.kh.mars.entity.BlockDto;

public interface BlockDao {

	BlockDto selectOne(int followWho, int memberNo);

	void blockMember(int followWho, int memberNo);

	void unBlockMember(int followWho, int memberNo);

}
