package com.kh.mars.repository;

public interface MemberProfileDao {

	void insert(int memberNo, int attachNo);

	int info(int memberNo);

}
