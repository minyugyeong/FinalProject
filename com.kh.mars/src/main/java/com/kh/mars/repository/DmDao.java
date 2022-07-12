package com.kh.mars.repository;

import java.util.List;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;
import com.kh.mars.entity.RoomEnterDto;
import com.kh.mars.vo.RoomRecordVO;
import com.kh.mars.vo.RoomVO;

public interface DmDao {
	
	List<RoomVO> roomList(int memberNo);

	List<RoomRecordVO> roomRecord(int memberNo, int roomNo);
	
	void insertRoomNo(int roomNo);
	
	RoomEnterDto insertRoomEnter(RoomEnterDto roomEnterDto);

	DmDto insertDm(DmDto dmDto);

	DmRecordDto insertDmRecordDto(DmRecordDto dmRecordDto);

	List<Integer> roomMember(int memberNo, int roomNo);
	
}
