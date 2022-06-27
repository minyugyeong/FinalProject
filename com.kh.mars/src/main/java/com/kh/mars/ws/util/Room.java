package com.kh.mars.ws.util;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.web.socket.TextMessage;

//채팅방
public class Room {

	//사용자
	private Set<User> users = new CopyOnWriteArraySet<>();
	
	//기능
		public boolean enter(User user) {//입장
			return users.add(user);
		}
		public boolean leave(User user) {//퇴장
			return users.remove(user);
		}
		public boolean contains(User user) {//검사
			return users.contains(user);
		}
		public void broadcast(TextMessage message) throws IOException {
			for(User user : users) {
				user.send(message);
			}
		}
}