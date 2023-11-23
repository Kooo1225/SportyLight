package com.sportylight.service;

import java.util.List;

import com.sportylight.domain.MessageVO;

public interface ChattingService {
	public List<MessageVO> beforeChatRead(int gatheringId);
}
