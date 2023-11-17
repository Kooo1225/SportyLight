package com.sportylight.mapper;

import com.sportylight.domain.MemberVO;

public interface MemberMapper {
	
	public MemberVO read(String email);
	
	public void insert(MemberVO member);

//	public int emailCheck(String email);
	

}
