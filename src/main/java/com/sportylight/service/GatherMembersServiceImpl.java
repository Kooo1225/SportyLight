package com.sportylight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportylight.domain.GatherMembersVO;
import com.sportylight.mapper.GatherMembersMapper;

@Service
public class GatherMembersServiceImpl implements GatherMembersService {

	@Autowired
	private GatherMembersMapper mapper;
	
	@Override
	public void updateState(int gatheringId, int membersId, int state) {
		mapper.updateState(gatheringId, membersId, state);
	}
	
	@Override
	public List<GatherMembersVO> getList(int gatheringId) {
		return mapper.getList(gatheringId);
	}

}
