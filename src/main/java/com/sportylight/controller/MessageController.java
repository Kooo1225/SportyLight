package com.sportylight.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportylight.domain.MessageVO;
import com.sportylight.service.ChattingService;

@Controller
public class MessageController {
	
	@Autowired
	private ChattingService service;
	
	@MessageMapping("/hello/room1")
	@SendTo("/subscribe/message/room1")
	public MessageVO sendMessage(String msg) {
		MessageVO vo = new MessageVO();		
		vo.setSendDate(new Date());
		
		return vo;
	}
	
	@RequestMapping("/chat")
	public String testChat(Model model) {
		System.out.println(service.beforeChatRead(31));
		model.addAttribute("list", service.beforeChatRead(31));
		
		return "chat";
	}
}
