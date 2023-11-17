package com.sportylight.mapper;

import java.util.List;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;

public interface GatherMapper {
	public GatherVO get(int gatheringNo);
	
	public List<GatherVO> getList();
	
	public List<GatherVO> getTypeList(EnumVO type);
	
	public void insert(GatherVO vo); // gathering register를 위해 선언
	
	public GatherVO read(int gatheringId); // gathering detail를 위해 선언
	
}
