package com.sportylight.service;

import java.io.File;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sportylight.domain.AuthVO;
import com.sportylight.domain.MemberVO;
import com.sportylight.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	public static final String AVATAR_UPLOAD_DIR = "/home/avatar"; 
	// 캡슐화 ->  private로 설정하고 return 해주는 코드를 사용해줜다

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private PasswordEncoder pwEncoder;

	public MemberVO checkEmail(String email) { // email 중복체크
		return mapper.checkEmail(email);
	}

	@Override
	public MemberVO checkNickname(String nickname) { // nickname 중복체크
		return mapper.checkNickname(nickname);
	}

	@Override
	public String getAvatarPath() {
		return AVATAR_UPLOAD_DIR;
	}

	@Override
	public void register(MemberVO member, MultipartFile avatar) throws Exception {

		String encodedPassword = pwEncoder.encode(member.getPassword());
		member.setPassword(encodedPassword);
		// 데이터베이스 members 테이블에 저장
		mapper.insert(member);

		AuthVO auth = new AuthVO(member.getMembersId(), "ROLE_USER");
		mapper.insertAuth(auth);

		File pngDest = new File(AVATAR_UPLOAD_DIR, member.getMembersId() + ".png");
		
		try {
			if(!avatar.isEmpty()) { 
				Thumbnails.of(avatar.getInputStream())
						.size(50, 50)
						.toFile(pngDest);
			}
		}
		catch(Exception e) {
			
		}
	}

	// 회원 정보 보기
	@Override
	public MemberVO getMember(int membersId) {
		return mapper.readMypage(membersId);
	}
	
	@Override
	public List<MemberVO> getManageList(int gatheringId) {
		return mapper.getManageList(gatheringId);
	}
	
	@Override
	public List<MemberVO> getNonManageList(int gatheringId) {
		return mapper.getNonManageList(gatheringId);
	}

	// 회원 비번 수정
	@Override
	public void updatePassword(int membersId, String newPassword) {
		mapper.updatePassword(membersId, newPassword);
	}
	
	// 회원 정보 수정
	@Override
	public void updateMp(int membersId, String nickname,MultipartFile avatar) throws IOException {
		mapper.updateMp(membersId, nickname);
         if(!avatar.isEmpty()) { 
			
			File pngDest = new File(AVATAR_UPLOAD_DIR, membersId + ".png"); // png 파일 넣는 부분
			
			Thumbnails.of(avatar.getInputStream())
					.size(50, 50)
					.toFile(pngDest);
		}
	}

	// 회원 탈퇴
	@Override
	public void withdrawalMember(int membersId) {
		mapper.delete(membersId); // 회원 정보 삭제

	}
	
	// 회원 탈퇴
	@Override
	public void withdrawalAuth(int membersId) {
		mapper.deleteAuth(membersId); // 회원 정보 삭제

	}

	// 아이디찾기
	@Override
	public MemberVO findId(Date birth, String name) {
		return mapper.findId(birth, name); // 회원 정보 삭제

	}

	@Override
	public MemberVO get2(String email) {
		return mapper.read2(email);
	}
	
	@Override
	public boolean findPw(String userName, String userId) {
		MemberVO vo = mapper.findPw(userName, userId);
		boolean result;
		
		if (vo == null) {
			result = false;
		}
		else {
			result = true;
		}
		
		return result;
	}
}
