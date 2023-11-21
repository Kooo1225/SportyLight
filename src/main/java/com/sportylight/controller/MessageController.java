package com.sportylight.controller;

import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportylight.domain.MessageVO;

@Controller
public class MessageController {
	
	@MessageMapping("/hello/{roomNo}")
	@SendTo("/sub/message/{roomNo}")
	public MessageVO sendMessage(MessageVO message) {
		
		message.setSendDate(new Date());
		
		return message;
	}
	
	@RequestMapping("/chat")
	public String testChat() {
		return "chat";
	}
}
