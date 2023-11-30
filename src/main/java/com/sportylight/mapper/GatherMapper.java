package com.sportylight.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;

public interface GatherMapper {
	public GatherVO get(int gatheringNo);
	
	public List<GatherVO> getList();
	
	public List<GatherVO> getSearch(SearchVO search);
	
	public List<GatherVO> getTypeList(EnumVO type);
	
	public List<GatherVO> getMyList(int membersId); // 내가 작성한 모임글
	
	public List<GatherVO> getMyState(int membersId); // 내가 신청한 모임글
	
	public int getJoinCount(int gatheringId); // 내가 신청한 모임글 개수
	
	public int removeGathering(int gatheringId); // gathering에서 delete_ny 1로 바꿈
	
	public int removeState(int gatheringId); // gathering_member에서 state 3으로 바꿈
	
	public int deleteMyState(@Param("gatheringId") int gatheringId, @Param("membersId") int membersId);
	
	public int update(GatherVO vo);
	
	public void insert(GatherVO vo); // gathering register를 위해 선언
	
	public GatherVO read(int gatheringId); // gathering detail를 위해 선언
	
	public int getState(@Param("gatheringId") int gatheringId, @Param("membersId") int membersId);
	
}
