package com.sportylight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sportylight.domain.GatherMembersVO;

@Service
public interface GatherMembersService {
	public void updateState(int gatheringId, int membersId, int state);
	
	public List<GatherMembersVO> getList(int gatheringId);
}
