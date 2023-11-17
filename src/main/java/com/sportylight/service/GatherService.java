package com.sportylight.service;

import java.util.List;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;

public interface GatherService {
	public List<GatherVO> getList();
	
	public List<GatherVO> getTypeList(EnumVO type);
	
	public void register(GatherVO vo); // gathering register를 위해 선언
	 
	public GatherVO get(int gatheringId); // gathering detail를 위해 선언
}
