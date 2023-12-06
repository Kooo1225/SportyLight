package com.sportylight.mapper;

import java.util.List;

import com.sportylight.domain.ContestEnumVO;
import com.sportylight.domain.ContestVO;

public interface ContestMapper {
	public List<ContestVO> getList();
	
	public List<ContestVO> getTypeList(ContestEnumVO types);
}
