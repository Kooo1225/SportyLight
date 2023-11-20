package com.sportylight.mapper;

import com.sportylight.domain.AuthVO;
import com.sportylight.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(int membersId);
	
	public MemberVO checkEmail(String email);
	
	public MemberVO checkNickname(String nickname);

	public MemberVO readMypage(int membersId);
	
	public void insert(MemberVO member);

	public void update(MemberVO updateMember);

	public void delete(int membersId);

//	public int emailCheck(String email);
	
	public MemberVO read2(String email);
	
	public void insertAuth(AuthVO auth);

}
