package com.kh.mars.ws.util;

import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mars.vo.MessageVO;

//여러 방을 관리하는 관리자
public class RoomManager {
	//방 목록
	private Map<String, Room> rooms = Collections.synchronizedMap(new HashMap<>());
	//대기실
	private Room waitingRoom = new Room();
	
	private ObjectMapper mapper = new ObjectMapper();
	
	//기능
	public void enterWaitingRoom(WebSocketSession session) {//대기실 입장
		User user = new User(session);
		waitingRoom.enter(user);
	}
	public void enterRoom(WebSocketSession session, String name) {//사용자를 방으로 입장
		//대기실에 있는 사용자를 꺼내고 삭제한 뒤 이름에 해당하는 방으로 입장시킨다
		//(주의) 방이 만들어져있는지 검사해야한다
		User user = new User(session);
		
		
		if(notExist(name)) {//방이 없으면
			//방을 생성하여 rooms에 추가한다
			createRoom(name);
		}
		//rooms의 name 방에 user를 추가한다
		getRoom(name).enter(user);
	}
	public void leave(WebSocketSession session) {
		User user = new User(session);
		//대기실에서 제거
		if(waitingRoom.contains(user)) {
			waitingRoom.leave(user);
		}
		
		//전체 방에서 사용자가 있으면 해당 방에서 사용자를 제거
		for(String name : rooms.keySet()) {//이름만 뽑아서
			Room room = getRoom(name);//방 정보를 얻어내고
			if(room.contains(user)) {//사용자가 있다면
				room.leave(user);//내보내세요
			}
		}
	}
	
	public Room getRoom(String name) {
		return rooms.get(name);
	}
	public void createRoom(String name) {
		Room room = new Room();
		rooms.put(name, room);
	}
	public boolean notExist(String name) {
		return rooms.containsKey(name) == false;
	}
	public void broadcastRoom(WebSocketSession session, String name, String message) throws IOException {
		User user = new User(session);
		if(!user.isMember()) return;//비회원 차단
		
		MessageVO messageVO = MessageVO.builder()
																.memberId(user.getMemberId())
																.memberAuth(user.getMemberGrade())
																.text(message)
																.time(new Date())
															.build();
		
		String json = mapper.writeValueAsString(messageVO);
		TextMessage textMessage = new TextMessage(json);
		getRoom(name).broadcast(textMessage);
	}
}