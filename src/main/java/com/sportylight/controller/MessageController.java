package com.sportylight.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportylight.domain.MessageVO;
import com.sportylight.security.domain.CustomUser;
import com.sportylight.service.ChattingService;

@Controller
public class MessageController {
	
	@Autowired
	private ChattingService service;
	
//	@MessageMapping("/hello/room1")
//	@SendTo("/subscribe/message/room1")
//	public MessageVO sendMessage(String msg) {
//		MessageVO vo = new MessageVO();		
//		vo.setSendDate(new Date());
//		
//		return vo;
//	}
	
	@MessageMapping("/hello/room1")
	@SendTo("/subscribe/message/room1")
	public String sendMessage(String msg) {
		
		return msg;
	}
	
	@RequestMapping("/chat")
	public String testChat(@AuthenticationPrincipal CustomUser customUser, Model model) {
		String nickName = customUser.getNickName();
		List<MessageVO> vo = service.beforeChatRead(31);
		
		System.out.println(vo);
		System.out.println(nickName);
		
		model.addAttribute("principalName", nickName);
		model.addAttribute("chatList", vo);
		
		return "chat";
	}
}
