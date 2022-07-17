package com.kh.mars.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;
import com.kh.mars.entity.RoomDto;
import com.kh.mars.entity.RoomEnterDto;
import com.kh.mars.vo.RecommendListVO;
import com.kh.mars.vo.RoomRecordVO;
import com.kh.mars.vo.RoomVO;

@SuppressWarnings("unused")
@Repository
public class DmDaoImpl implements DmDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RoomVO> roomList(int memberNo) {
		return sqlSession.selectList("dm.roomList", memberNo);
	}

	@Override
	public List<RoomRecordVO> roomRecord(int memberNo, int roomNo, int uptoNo, int dmCount) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("roomNo", roomNo);
		param.put("uptoNo", uptoNo);
		param.put("dmCount", dmCount);
		return sqlSession.selectList("dm.roomDetail", param);
	}

	@Override
	public void insertRoomNo(int roomNo) {
		int roomSequence = sqlSession.selectOne("dm.roomSequence");
		RoomDto roomDto = new RoomDto();
		roomDto.setRoomNo(roomSequence);
	}

	@Override
	public RoomEnterDto insertRoomEnter(RoomEnterDto roomEnterDto) {
		sqlSession.insert("dm.insertRoomEnter");
		return roomEnterDto;
		
	}

	@Override
	public DmDto insertDm(DmDto dmDto) {
		int dmNo= sqlSession.selectOne("dm.dmSequence");
		dmDto.setDmNo(dmNo);
		sqlSession.insert("dm.insertDm", dmDto);
		return dmDto;
	}

	@Override
	public DmRecordDto insertDmRecordDto(DmRecordDto dmRecordDto) {
		sqlSession.insert("dm.insertRecord", dmRecordDto);
		return dmRecordDto;
	}

	@Override
	public List<Integer> roomMember(int memberNo, int roomNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("roomNo", roomNo);
		return sqlSession.selectList("dm.roomMember", param);
	}

	@Override
	public List<RecommendListVO> chooseDm(int memberNo) {
		return sqlSession.selectList("dm.chooseDm", memberNo);
	}

	@Override
	public int roomSearch(int memberNo, int targetNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("memberNo", memberNo);
		param.put("targetNo", targetNo);
		if(sqlSession.selectOne("dm.roomSearch", param) != null) {
			return sqlSession.selectOne("dm.roomSearch", param);
		}else {
			return 0;
		}
	}

	
	@Override
	public int roomCreate() {
		int roomNo = sqlSession.selectOne("dm.roomSeq");
		sqlSession.insert("dm.roomCreate", roomNo);
		return roomNo;
	}

	@Override
	public void roomEnter(int roomNo, int memberNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("roomNo", roomNo);
		param.put("memberNo", memberNo);
		sqlSession.insert("dm.roomEnter", param);
	}

	@Override
	public void dmCheck(int memberNo, int roomNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("roomNo", roomNo);
		param.put("memberNo", memberNo);
		sqlSession.update("dm.dmCheck", param);
	}

	@Override
	public void roomEnterUpdate(int roomNo) {
		sqlSession.update("dm.roomEnterUpdate", roomNo);
	}

	@Override
	public List<RecommendListVO> dmMemberSearch(int memberNo, String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("keyword", keyword);
		param.put("memberNo", memberNo);
		return sqlSession.selectList("dm.dmMemberSearch", param);
	}

	@Override
	public void roomExit(int memberNo, int roomNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("roomNo", roomNo);
		param.put("memberNo", memberNo);
		sqlSession.update("roomExit", param);
	}
	
	

	
	

}
