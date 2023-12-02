package com.sportylight.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sportylight.domain.GatherMembersVO;

public interface GatherMembersMapper {
	public void updateState(@Param("gatheringId") int gatheringId, @Param("membersId") int membersId, @Param("state") int state);
	
	public List<GatherMembersVO> getList(int gatheringId);
}
