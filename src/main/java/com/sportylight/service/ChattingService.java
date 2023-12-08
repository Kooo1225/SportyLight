package com.sportylight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.MessageVO;

@Service
public interface ChattingService {
	public List<MessageVO> beforeChatRead(int gatheringId);
	
	public void insert(MessageVO message);
	
	public List<GatherVO> getChattingList(int membersId);
}
