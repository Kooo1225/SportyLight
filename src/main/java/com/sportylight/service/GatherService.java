package com.sportylight.service;

import java.util.List;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;

public interface GatherService {
	public List<GatherVO> getList();
	
	public List<GatherVO> getSearch(SearchVO search);
	
	public List<GatherVO> getTypeList(EnumVO type);
	
	public List<GatherVO> getMyList(int membersId);
	
	public List<GatherVO> getMyState(int membersId);
		
	public void remove(int gatheringId); // gathering에서 delete_ny 1로 바꿈
	
	public void register(GatherVO vo); // gathering register를 위해 선언
	
	public boolean modify(GatherVO vo);
	
	public boolean deleteMyState(int gatheringId, int membersId); // 내가 신청한 글 신청취소
	 
	public GatherVO get(int gatheringId); // gathering detail를 위해 선언
	
	public int getState(int gatheringId, int membersId);
}
