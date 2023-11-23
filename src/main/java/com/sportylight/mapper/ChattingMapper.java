package com.sportylight.mapper;

import java.util.List;

import com.sportylight.domain.MessageVO;

public interface ChattingMapper {
	
	public List<MessageVO> beforeChatRead(int gatheringId);
	
	public void insert(MessageVO vo);
}
