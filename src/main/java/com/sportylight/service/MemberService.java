package com.sportylight.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sportylight.domain.MemberVO;

@Service
public interface MemberService {

	// 회원정보 email로 가져오기(email 중복체크)
	public MemberVO checkEmail(String email);

	// 회원정보 email로 가져오기
	public MemberVO checkNickname(String nickname);
	
	public String getAvatarPath();

	public void register(MemberVO member, MultipartFile avatar) throws Exception;

	// 회원 정보 조회
	public MemberVO getMember(int membersId);

	public List<MemberVO> getManageList(int gatheringId);
	
	public List<MemberVO> getNonManageList(int gatheringId);
	
	// 회원 정보 수정
	void updateMp (int membersId, String nickname,  MultipartFile avatar) throws IOException;;
	
	// 회원 비번 수정
	void updatePassword(int membersId, String newPassword);

	// 회원 탈퇴
	void withdrawalMember(int membersId);
	
	void withdrawalAuth(int membersId);
	
	public MemberVO get2(String email);

	public MemberVO findId(Date birth, String name);

	public boolean findPw(String userName, String userId);
}
