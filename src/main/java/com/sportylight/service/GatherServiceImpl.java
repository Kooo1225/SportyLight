package com.sportylight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.mapper.GatherMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class GatherServiceImpl implements GatherService {

	@Autowired
	private GatherMapper mapper;
	
	@Override
	public List<GatherVO> getList() {
		return mapper.getList();
	}
	
	@Override
	public List<GatherVO> getTypeList(EnumVO type) {
		return mapper.getTypeList(type);
	}
		
}
