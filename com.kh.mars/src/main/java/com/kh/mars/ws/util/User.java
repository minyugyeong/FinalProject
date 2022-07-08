package com.kh.mars.ws.util;

import java.io.IOException;
import java.util.Map;
import java.util.Objects;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import lombok.EqualsAndHashCode;
import lombok.Getter;

//사용자
@EqualsAndHashCode(of = {"webSocketSession"})
public class User {

	@Getter
	private WebSocketSession webSocketSession;
	public void setWebSocketSession(WebSocketSession webSocketSession) {
		this.webSocketSession = webSocketSession;
		Map<String, Object> attr = webSocketSession.getAttributes();
		this.memberNo = (Integer) attr.get("login");
	}

	@Getter
	private int memberNo;
	
	@Getter
	private String memberNick;



	public User(WebSocketSession webSocketSession) {
		this.setWebSocketSession(webSocketSession);
	}

	//추가기능 
	public boolean isMember() {
		return this.memberNo > 0;
	}
	
	public void send(TextMessage message) throws IOException {
		webSocketSession.sendMessage(message);
	}
}