package com.sportylight.mapper;

import java.util.List;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;

public interface GatherMapper {
	public GatherVO get(int gatheringNo);
	
	public List<GatherVO> getList();
	
	public List<GatherVO> getTypeList(EnumVO type);
	
}
