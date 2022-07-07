package com.kh.mars.rest;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.mars.entity.DmDto;
import com.kh.mars.entity.DmRecordDto;
import com.kh.mars.entity.RoomEnterDto;
import com.kh.mars.repository.DmDao;
import com.kh.mars.vo.RoomRecordVO;
import com.kh.mars.vo.RoomVO;

@RestController
@RequestMapping("/rest/dm")
public class DMRestController {

	@Autowired
	private DmDao dmDao;
	
	@GetMapping("/room")
	public List<RoomVO> roomlist(
								HttpSession session){
		session.setAttribute("login", 31);//지우기
		int memberNo = (Integer) session.getAttribute("login");
		return dmDao.roomList(memberNo);
	}
	
	@GetMapping("/room_record/{roomNo}")
	public List<RoomRecordVO> roomRecord(
										@PathVariable int roomNo,
										HttpSession session
										){
		session.setAttribute("login", 31);//지우기
		int memberNo = (Integer) session.getAttribute("login");
		List<RoomRecordVO> list = dmDao.roomRecord(memberNo, roomNo);
		System.out.println("리스트사이즈 = " + list.size());
		System.out.println("리스트 = " + list);
		return list;
	}
	
	/*
	 * @PostMapping("") public RoomEnterDto insert(@RequestBody RoomEnterDto
	 * roomEnterDto) { return dmDao.insertRoomEnter(roomEnterDto); }
	 * 
	 * @PostMapping("") public DmDto insert(@RequestBody DmDto dmDto) { return
	 * dmDao.insertDm(dmDto); }
	 * 
	 * @PostMapping("") public DmRecordDto insert(@RequestBody DmRecordDto
	 * dmRecordDto) { return dmDao.insertDmRecordDto(dmRecordDto); }
	 */
}
