package com.kh.mars.ws.util;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mars.repository.DmDao;
import com.kh.mars.service.DmService;
import com.kh.mars.vo.MessageVO;

//여러 방을 관리하는 관리자
public class RoomManager {
	@Autowired
	private DmDao dmDao;
	@Autowired
	private DmService dmService;
	
	//방 목록
	private Map<Integer, Room> rooms = Collections.synchronizedMap(new HashMap<>());
	//대기실
	private Room waitingRoom = new Room();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	
	
	//기능
	public void enterWaitingRoom(WebSocketSession session) {//대기실 입장
		User user = new User(session);
		waitingRoom.enter(user);
	}
	public void enterRoom(WebSocketSession session, int no) {//사용자를 방으로 입장
		//대기실에 있는 사용자를 꺼내고 삭제한 뒤 이름에 해당하는 방으로 입장시킨다
		//(주의) 방이 만들어져있는지 검사해야한다
		User user = new User(session);
		//waitingRoom.leave(user);//대기실에서 사용자를 내보낸다
		
		if(notExist(no)) {//방이 없으면
			//방을 생성하여 rooms에 추가한다
			createRoom(no);
		}
		
		//모든룸에서 일단 나오게 한 후
		for(int no2 : rooms.keySet()) {//이름만 뽑아서
			Room room = getRoom(no2);//방 정보를 얻어내고
			if(room.contains(user)) {//사용자가 있다면
				room.leave(user);//내보내세요
			}
		}
		
		//rooms의 name 방에 user를 추가한다
		getRoom(no).enter(user);
	}
	public void leave(WebSocketSession session) {
		User user = new User(session);
		//대기실에서 제거
		if(waitingRoom.contains(user)) {
			waitingRoom.leave(user);
		}
		
		//전체 방에서 사용자가 있으면 해당 방에서 사용자를 제거
		for(int no : rooms.keySet()) {//이름만 뽑아서
			Room room = getRoom(no);//방 정보를 얻어내고
			if(room.contains(user)) {//사용자가 있다면
				room.leave(user);//내보내세요
			}
		}
	}
	
	public Room getRoom(int no) {
		return rooms.get(no);
	}
	public void createRoom(int no) {
		Room room = new Room();
		rooms.put(no, room);
	}
	public boolean notExist(int no) {
		return rooms.containsKey(no) == false;
	}
	public void broadcastRoom(WebSocketSession session, int roomNo, String message, int target, int messageType) throws IOException {
		User user = new User(session);
		if(!user.isMember()) return;//비회원 차단
		MessageVO messageVO = MessageVO.builder()
																.who(user.getMemberNo())
																.roomNo(roomNo)
																.dmContent(message)
																.dmRecordTime(new Date())
																.messageType(messageType)
															.build();
		//dmDao.insertDmRecordDto(messageVO);
		String json = mapper.writeValueAsString(messageVO);
		TextMessage textMessage = new TextMessage(json);
		
		User target2 = waitingRoom.findUser(target);
		if(target2!=null) {
			target2.send(textMessage);
		}
		user.send(textMessage);
		
//		if(getRoom(roomNo).isExist(target)) {
//			getRoom(roomNo).broadcast(textMessage);
//		} else {
//			waitingRoom.broadcast(textMessage);
//		}
	}
	
	public void alramRoom(WebSocketSession session, int memberNo,int messageType) throws IOException {
		MessageVO messageVO = MessageVO.builder()
				.who(memberNo)
				.messageType(messageType)
			.build();
		String json = mapper.writeValueAsString(messageVO);
		TextMessage textMessage = new TextMessage(json);
		User target = waitingRoom.findUser(memberNo);
		if(target!=null) {
			target.send(textMessage);
			System.out.println("알람메세지 전송");
		}
	}
}