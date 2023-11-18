package com.sportylight.mapper;

import com.sportylight.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String membersId);

	public void insert(MemberVO member);

	public void update(MemberVO updateMember);

	public void delete(String membersId);

//	public int emailCheck(String email);

}
