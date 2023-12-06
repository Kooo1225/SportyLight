package com.sportylight.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sportylight.domain.CategoryEnumVO;
import com.sportylight.domain.GatherMembersVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;
import com.sportylight.mapper.GatherMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
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
	public List<GatherVO> getTopic() {
		return mapper.getTopic();
	}

  @Override
	@Transactional
	public List<GatherVO> getRegionList(String region){
		List<GatherVO> vo = mapper.getRegionList(region);
		vo.addAll(mapper.getNotRegionList(region));
		
		return vo;
	};

	
	@Override
	public List<GatherVO> getSearch(SearchVO search) {
		return mapper.getSearch(search);
	}
	
	@Override
	@Transactional
	public List<GatherVO> getTypeList(CategoryEnumVO type, String region) {
		List<GatherVO> vo = mapper.getTypeList(type, region);
		vo.addAll(mapper.getNonTypeList(type, region));
		
		return vo;
	}
	
	@Override
	@Transactional
	public List<GatherVO> getMyList(int membersId) {
		List<GatherVO> vo = mapper.getMyList(membersId);
		
		for(GatherVO g: vo) {
			g.setParticipate(mapper.getJoinCount(g.getGatheringId()));
		}

		return vo;
	}
	
	@Override
	public List<GatherVO> getMyState(int membersId) {
		List<GatherVO> vo = mapper.getMyState(membersId);
		
		for(GatherVO g: vo) {
			g.setParticipate(mapper.getJoinCount(g.getGatheringId()));
		}
//		return mapper.getMyState(membersId);
		return vo;
	}
	
	@Override
	public int getSumJoin() {
		return mapper.getSumJoinCount();
	}
	
	@Override
	public int getSumHead() {
		return mapper.getSumHeadCount();
	}
	
	@Override
	public boolean modify(GatherVO vo) {

		log.info("modify......" + vo);
		
		return mapper.update(vo) == 1;
	}
	
	@Override
	@Transactional
	public void remove(int gatheringId) {

		mapper.removeGathering(gatheringId);
		mapper.removeState(gatheringId);
	}
	
	@Override
	public void register(GatherVO vo) {
		mapper.insert(vo);
	}
	
	@Override
	public void insertApply(GatherMembersVO vo) {
		mapper.insertApply(vo);
	}

	@Override
	public GatherVO get(int gatheringId) {
		return mapper.read(gatheringId);
	}
	
	@Override
	public boolean deleteMyState(int gatheringId, int membersId) {
		return mapper.deleteMyState(gatheringId, membersId) == 1;
	}

	@Override
	public Integer getState(int gatheringId, int membersId) {
		return mapper.getState(gatheringId, membersId);
	}
		
}
