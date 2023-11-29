package com.sportylight.controller;

import java.nio.charset.StandardCharsets;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.MessageVO;
import com.sportylight.security.domain.CustomUser;
import com.sportylight.service.ChattingService;

@Controller
public class MessageController {
	
	@Autowired
	private ChattingService service;
	
	@MessageMapping("/gatherChat/{roomId}")
	@SendTo("/subscribe/message/{roomId}")
	public MessageVO sendMessage(@DestinationVariable int roomId, MessageVO msg) {	
		LocalDateTime currentTime = LocalDateTime.now();	
		msg.setSendDate(currentTime);
		
//		String encodedMessage = Base64.getEncoder().encodeToString(msg.getMessage().getBytes(StandardCharsets.UTF_8));
//		msg.setMessage(encodedMessage);
		
		service.insert(msg);
		
		return msg;
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.POST)
	public String testChat(@AuthenticationPrincipal CustomUser customUser, int gatheringId, Model model) {
		List<MessageVO> vo = service.beforeChatRead(gatheringId);
		List<GatherVO> chatList = service.getChattingList(customUser.getMembersId());
		
		System.out.println(vo);
		
		model.addAttribute("chattingList", chatList);
		model.addAttribute("customUser", customUser);
		model.addAttribute("chatList", vo);
		model.addAttribute("gatheringId", gatheringId);
		
		return "chat/chat";
	}
}
