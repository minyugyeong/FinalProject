package com.kh.mars.ws;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.mars.vo.ReceiveVO;
import com.kh.mars.ws.util.RoomManager;

public class DMWebsocketServer extends TextWebSocketHandler{

	private RoomManager manager = new RoomManager();
	private ObjectMapper mapper = new ObjectMapper();
	
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
		ReceiveVO receiveVO = mapper.readValue(message.getPayload(), ReceiveVO.class);
		
		if(receiveVO.getType() == join) {
			manager.enterRoom(session, receiveVO.getRoomNo());
		}
		else if(receiveVO.getType() == chat) {
			manager.broadcastRoom(session, receiveVO.getRoomNo(), receiveVO.getMessage());
		}
		
	}
}
