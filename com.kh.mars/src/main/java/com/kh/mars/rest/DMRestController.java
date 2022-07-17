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
import com.kh.mars.service.DmService;
import com.kh.mars.vo.RecommendListVO;
import com.kh.mars.vo.RoomRecordVO;
import com.kh.mars.vo.RoomVO;

@RestController
@RequestMapping("/rest/dm")
public class DMRestController {

	@Autowired
	private DmDao dmDao;
	
	@Autowired
	private DmService dmService;
	
	@GetMapping("/room")
	public List<RoomVO> roomlist(
								HttpSession session){
		int memberNo = (Integer) session.getAttribute("login");
		return dmDao.roomList(memberNo);
	}
	
	@GetMapping("/room_record")
	public List<RoomRecordVO> roomRecord(
										@RequestParam int roomNo,
										@RequestParam int uptoNo,
										@RequestParam int dmCount,
										HttpSession session
										){
		int memberNo = (Integer) session.getAttribute("login");
		List<RoomRecordVO> list = dmDao.roomRecord(memberNo, roomNo, uptoNo, dmCount);
		System.out.println("리스트사이즈 = " + list.size());
		System.out.println("리스트 = " + list);
		return list;
	}
	
	@GetMapping("room_member/{roomNo}")
	public List<Integer> roomMember(
							@PathVariable int roomNo,
							HttpSession session) {
		int memberNo = (Integer) session.getAttribute("login");
		List<Integer> list = dmDao.roomMember(memberNo, roomNo);
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
	@GetMapping("/chat/{no}")
	public String channel(@PathVariable int no, Model model) {
		model.addAttribute("roomNo", no);
		return "chat";
	}
	
	@GetMapping("/choose_dm")
	public List<RecommendListVO> chooseDm(
										HttpSession session
										){
		int memberNo = (Integer) session.getAttribute("login");
		return dmDao.chooseDm(memberNo);
	}
	
	@PostMapping("/room_search")
	public int roomSearch(
						@RequestParam int targetNo,
						HttpSession session
							) {
		int memberNo = (Integer) session.getAttribute("login");
		return dmService.room(memberNo, targetNo);
	}
	
	@PostMapping("/dm_check")
	public void dmCheck(
						@RequestParam int roomNo,
						HttpSession session
						) {
		int memberNo = (Integer) session.getAttribute("login");
		dmDao.dmCheck(memberNo, roomNo);
	}
	
	@GetMapping("/dm_member_search")
	public List<RecommendListVO> dmMemberSearch(
										 	HttpSession session,
										 	@RequestParam String keyword
											){
		int memberNo = (Integer) session.getAttribute("login");
		return dmDao.dmMemberSearch(memberNo, keyword);
	}
}
