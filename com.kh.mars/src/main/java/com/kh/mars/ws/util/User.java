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
		this.memberId = (String) attr.get("login");
		this.memberGrade = (String) attr.get("auth");
	}

	@Getter
	private String memberId;

	@Getter
	private String memberGrade;

	public User(WebSocketSession webSocketSession) {
		this.setWebSocketSession(webSocketSession);
	}

	//추가기능 
	public boolean isMember() {
		return this.memberId != null && this.memberGrade != null;
	}
	public boolean isAdmin() {
		return this.isMember() && this.memberGrade.equals("관리자");
	}
	public void send(TextMessage message) throws IOException {
		webSocketSession.sendMessage(message);
	}
}