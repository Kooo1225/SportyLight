package com.sportylight.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sportylight.domain.CategoryEnumVO;
import com.sportylight.domain.GatherMembersVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;

public interface GatherService {
	public List<GatherVO> getList();
	
	public List<GatherVO> getTopic();
	
	public List<GatherVO> getSearch(SearchVO search);
	
	public List<GatherVO> getRegionList(String region);
	
	public List<GatherVO> getTypeList(CategoryEnumVO type, String region);
	
	public List<GatherVO> getMyList(int membersId);
	
	public List<GatherVO> getMyState(int membersId);
	
	public int getSumJoin();
	
	public int getSumHead();
		
	public void remove(int gatheringId); // gathering에서 delete_ny 1로 바꿈
	
	public void register(GatherVO vo); // gathering register를 위해 선언
	
	public void insertApply(GatherMembersVO vo);
	
	public boolean modify(GatherVO vo);
	
	public boolean deleteMyState(int gatheringId, int membersId); // 내가 신청한 글 신청취소
	 
	public GatherVO get(int gatheringId); // gathering detail를 위해 선언
	
	public Integer getState(int gatheringId, int membersId);
	
}
