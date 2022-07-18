package com.kh.mars.ws;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mars.repository.DmDao;
import com.kh.mars.service.DmService;
import com.kh.mars.vo.ReceiveVO;
import com.kh.mars.ws.util.RoomManager;
import com.kh.mars.ws.util.User;

public class DMWebsocketServer extends TextWebSocketHandler{

	private RoomManager manager = new RoomManager();
	private ObjectMapper mapper = new ObjectMapper();
	
	@Autowired
	private DmService dmService;
	
	@Autowired
	private DmDao dmDao;
	
	public static final int join = 1, chat = 2;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		manager.enterWaitingRoom(session);
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		manager.leave(session);
	}
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		User user = new User(session);
		ReceiveVO receiveVO = mapper.readValue(message.getPayload(), ReceiveVO.class);
		System.out.println("타입" + receiveVO.getType());
		System.out.println("방번호"+receiveVO.getRoomNo());
		if(receiveVO.getType() == join) {
			manager.enterRoom(session, receiveVO.getRoomNo());
		}
		else if(receiveVO.getType() == chat) {
			dmDao.roomEnterUpdate(receiveVO.getRoomNo());
			dmService.dmService(receiveVO.getRoomNo(), receiveVO.getMessage(), receiveVO.getTarget(), user.getMemberNo());
			manager.broadcastRoom(session, receiveVO.getRoomNo(), receiveVO.getMessage(), receiveVO.getTarget());
		}
		
	}
}
