package com.sportylight.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sportylight.domain.CategoryEnumVO;
import com.sportylight.domain.GatherMembersVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;

public interface GatherMapper {
	public GatherVO get(int gatheringNo);
	
	public List<GatherVO> getList();
	
	public List<GatherVO> getTopic();

	public List<GatherVO> getRegionList(String region);
	
	public List<GatherVO> getNotRegionList(String region);
	
	public List<GatherVO> getSearch(SearchVO search);
	
	public List<GatherVO> getTypeList(@Param("type") CategoryEnumVO type, @Param("region") String region);
	
	public List<GatherVO> getNonTypeList(@Param("type") CategoryEnumVO type, @Param("region") String region);
	
	public List<GatherVO> getMyList(int membersId); // 내가 작성한 모임글
	
	public List<GatherVO> getMyState(int membersId); // 내가 신청한 모임글
	
	public int getParticipateCount(int gatheringId);
	
	public int getJoinCount(int gatheringId); // 내가 신청한 모임글 개수
	
	public int getSumJoinCount(); // 등록된 모임의 신청한 인원 총합
	
	public int getSumHeadCount(); // 등록된 모임의 모집인원 총합
	
	public int removeGathering(int gatheringId); // gathering에서 delete_ny 1로 바꿈
	
	public int removeState(int gatheringId); // gathering_member에서 state 3으로 바꿈
	
	public int deleteMyState(@Param("gatheringId") int gatheringId, @Param("membersId") int membersId);
	
	public int update(GatherVO vo);
	
	public void insert(GatherVO vo); // gathering register를 위해 선언
	
	public void insertApply(GatherMembersVO vo);
	
	public GatherVO read(int gatheringId); // gathering detail를 위해 선언
	
	public Integer getState(@Param("gatheringId") int gatheringId, @Param("membersId") int membersId);
	
	public List<GatherMembersVO> getManagerList(int gatheringId);
	
	
}
