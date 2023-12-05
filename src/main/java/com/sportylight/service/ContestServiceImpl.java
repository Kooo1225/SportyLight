package com.sportylight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportylight.domain.ContestEnumVO;
import com.sportylight.domain.ContestVO;
import com.sportylight.mapper.ContestMapper;

@Service
public class ContestServiceImpl implements ContestService {

	@Autowired
	private ContestMapper mapper;
	
	@Override
	public List<ContestVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<ContestVO> getTypeList(ContestEnumVO types){
		return mapper.getTypeList(types);
	}
}
