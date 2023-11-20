package com.sportylight.service;

import java.io.File;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sportylight.domain.MemberVO;
import com.sportylight.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	public static final String AVATAR_UPLOAD_DIR = "c:/upload/avatar";
	
	@Autowired
	MemberMapper mapper;
	
//	@Autowired
//	private PasswordEncoder pwEncoder; // 비밀번호 암호화에서 에러나서 읻단 주석처리
	
	@Override
	public MemberVO checkEmail(String email) {		//email 중복체크
		return mapper.checkEmail(email);
	}
	
	@Override
	public MemberVO checkNickname(String nickname) {		//nickname 중복체크
		return mapper.checkNickname(nickname);
	}
	
	//아이디 중복체크 mapper 접근
//	@Override
//	public int emailCheck(String email) {
//		int cnt = mapper.emailCheck(email);
//		System.out.println("cnt: " + cnt);
//		return cnt;
//	}
			
	@Override
	public void register(MemberVO member, MultipartFile avatar) throws IOException {
		
		// 데이터베이스 members 테이블에 저장
		mapper.insert(member);
		
//		if(!avatar.isEmpty()) { //아바타 넣는 부분에서 null값이 들어갔을 때 에러가 나서 주석처리
//			
//			File pngDest = new File(AVATAR_UPLOAD_DIR, member.getEmail() + ".png"); // png 파일 넣는 부분
//			
//			Thumbnails.of(avatar.getInputStream())
//					.size(50, 50)
//					.toFile(pngDest);
//		}
		
		
	}
	
	// 회원 정보 보기
	@Override
	public MemberVO getMember(String membersId) {

		return mapper.read(membersId);

	}

	// 회원 정보 수정
	@Override
	public void updateMember(MemberVO updateMember) {
		mapper.update(updateMember);
	}
	
	// 회원 탈퇴 
	@Override
    public void withdrawlMember(String membersId) {
        mapper.delete(membersId); // 회원 정보 삭제
      
    }
	
}
