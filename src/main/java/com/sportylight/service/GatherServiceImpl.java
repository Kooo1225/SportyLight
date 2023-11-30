package com.sportylight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;
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
	public List<GatherVO> getSearch(SearchVO search) {
		return mapper.getSearch(search);
	}
	
	@Override
	public List<GatherVO> getTypeList(EnumVO type) {
		return mapper.getTypeList(type);
	}
	
	@Override
	public List<GatherVO> getMyList(int membersId) {
		return mapper.getMyList(membersId);
	}
	
	@Override
	public List<GatherVO> getMyState(int membersId) {
		return mapper.getMyState(membersId);
	}
	
	@Override
	public void register(GatherVO vo) {
		mapper.insert(vo);
	}

	@Override
	public GatherVO get(int gatheringId) {
		return mapper.read(gatheringId);
	}
	
	@Override
	public int getState(int gatheringId, int membersId) {
		return mapper.getState(gatheringId, membersId);
	}
		
}
