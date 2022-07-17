package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;
import com.kh.mars.entity.RoomEnterDto;
import com.kh.mars.vo.RecommendListVO;
import com.kh.mars.vo.RoomRecordVO;
import com.kh.mars.vo.RoomVO;

public interface DmDao {
	
	List<RoomVO> roomList(int memberNo);

	List<RoomRecordVO> roomRecord(int memberNo, int roomNo, int uptoNo, int dmCount);
	
	void insertRoomNo(int roomNo);
	
	RoomEnterDto insertRoomEnter(RoomEnterDto roomEnterDto);

	DmDto insertDm(DmDto dmDto);

	DmRecordDto insertDmRecordDto(DmRecordDto dmRecordDto);

	List<Integer> roomMember(int memberNo, int roomNo);

	List<RecommendListVO> chooseDm(int memberNo);
	
	int roomSearch(int memberNo, int targetNo);
	
	int roomCreate();
	
	void roomEnter(int roomNo, int memberNo);

	void dmCheck(int memberNo, int roomNo);
	
	void roomEnterUpdate(int roomNo);

	List<RecommendListVO> dmMemberSearch(int memberNo, String keyword);
}
