package com.sportylight.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.sportylight.domain.MemberVO;

public interface MemberService {
	
	public MemberVO get(String email);
	
	public void register(MemberVO member, MultipartFile avatar) throws IOException;
	
	// 회원 정보 조회
    public MemberVO getMember(String membersId);

    // 회원 정보 수정
    void updateMember(MemberVO updateMember);
    
    // 회원 탈퇴
    void withdrawlMember(String membersId);
   
	
//	public int emailCheck(String email);
}
