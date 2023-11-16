package com.sportylight.service;

import java.util.List;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;

public interface GatherService {
	public List<GatherVO> getList();
	
	public List<GatherVO> getTypeList(EnumVO type);
}
