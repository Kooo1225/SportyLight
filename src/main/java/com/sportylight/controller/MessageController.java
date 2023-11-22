package com.sportylight.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportylight.domain.MessageVO;

@Controller
public class MessageController {
	
	@MessageMapping("/hello/room1")
	@SendTo("/subscribe/message/room1")
	public MessageVO sendMessage(MessageVO message, @Header("simpSessionId") String sessionId) {
		System.out.println(message);
		System.out.println("Received message ID : " + sessionId);
		message.setSendDate(new Date());
		
		return message;
	}
	
	@RequestMapping("/chat")
	public String testChat() {
		return "chat";
	}
}
