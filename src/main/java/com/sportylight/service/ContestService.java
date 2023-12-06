package com.sportylight.service;

import java.util.List;

import com.sportylight.domain.ContestEnumVO;
import com.sportylight.domain.ContestVO;

public interface ContestService {
	public List<ContestVO> getList();
	
	public List<ContestVO> getTypeList(ContestEnumVO types);
}
