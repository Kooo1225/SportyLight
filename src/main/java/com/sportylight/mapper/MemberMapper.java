package com.sportylight.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sportylight.domain.AuthVO;
import com.sportylight.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String email);

	public MemberVO checkEmail(String email);

	public MemberVO checkNickname(String nickname);

	public MemberVO readMypage(int membersId);
	
	public List<MemberVO> getManageList(int gatheringId);
	
	public List<MemberVO> getNonManageList(int gatheringId);

	public void insert(MemberVO member);

	public void updateMp (
			@Param("membersId") int membersId, @Param("nickname") String nickname);
	
	public void updatePassword(
			 @Param("membersId") int membersId, @Param("newPassword") String newPassword);

	public void delete(int membersId);
	
	public void deleteAuth(int membersId);

	public MemberVO read2(String email);

	public void insertAuth(AuthVO auth);

	public MemberVO findId(@Param("birth") Date birth, @Param("name") String name);
	
	public MemberVO findPw(@Param("userName") String userName, @Param("userId") String userId);

}
