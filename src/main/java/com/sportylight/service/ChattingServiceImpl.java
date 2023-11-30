package com.sportylight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.MessageVO;
import com.sportylight.mapper.ChattingMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingMapper mapper;
	
	@Override
	public List<MessageVO> beforeChatRead(int gatheringId) {
		return mapper.beforeChatRead(gatheringId);
	}

	@Override
	public void insert(MessageVO message) {
		mapper.insert(message);
	}
	
	@Override
	public List<GatherVO> getChattingList(int membersId) {
		return mapper.getChattingList(membersId);
	}
}
