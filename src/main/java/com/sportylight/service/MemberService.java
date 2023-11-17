package com.sportylight.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.sportylight.domain.MemberVO;

public interface MemberService {
	
	public MemberVO get(String email);
	
	public void register(MemberVO member, MultipartFile avatar) throws IOException;
	
//	public int emailCheck(String email);
}
