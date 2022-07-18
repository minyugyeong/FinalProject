package com.kh.mars.repository;

public interface MemberProfileDao {

	Integer selectAttachNo(Integer memberNo);
	
	void insert(int memberNo, int attachNo);

	int info(int memberNo);

	void delete(int memberNo);

}
