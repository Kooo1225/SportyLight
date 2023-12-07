package com.sportylight.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sportylight.domain.ContestEnumVO;
import com.sportylight.domain.ContestVO;

@Service
public interface ContestService {
	public List<ContestVO> getList();
	
	public List<ContestVO> getTypeList(ContestEnumVO types);
}
