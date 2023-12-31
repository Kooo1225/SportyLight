package com.sportylight.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;

import com.sportylight.domain.CategoryEnumVO;
import com.sportylight.domain.MemberVO;
import com.sportylight.mapper.MemberMapper;
import com.sportylight.security.domain.CustomUser;
import com.sportylight.service.MemberService;

@Controller
@RequestMapping("/mypage")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping
	public String myPage(@AuthenticationPrincipal CustomUser customUser, MultipartFile avatar,Model model) {
	  	int membersId = customUser.getMembersId();
		  
		  	// 받아온 ID로 조회
	    MemberVO member = memberService.getMember(membersId);
	    // 모델에 담아서 뷰 반환
	    model.addAttribute("member", member);
	
	    return "mypage/mypage";
	}
	
    // 회원 정보 수정 페이지로 이동
	@GetMapping("/update")
	public String mpupdate(@AuthenticationPrincipal CustomUser customUser, Model model) {
		int membersId = customUser.getMembersId();
		  
	  	// 받아온 ID로 조회
	    MemberVO member = memberService.getMember(membersId);
	    // 모델에 담아서 뷰 반환
	    model.addAttribute("member", member);
	    
	    System.out.println("member : " +member);
	    System.out.println("customUser : " +customUser);
	    return "mypage/mypageupdate";
	    }
	
    // 회원 정보 수정 처리
	@PostMapping("/update")
		public String savempupdate(@AuthenticationPrincipal CustomUser customUser,String nickname,MultipartFile avatar) throws IOException {
		int membersId = customUser.getMembersId();
		 
		 memberService.updateMp(membersId, nickname, avatar);
		 
		return "mypage/mypage";
	
		}
	
	@GetMapping("/check/{nickname}")
	@ResponseBody
	public boolean checkNickName(@PathVariable String nickname) {
		if(memberService.checkNickname(nickname) == null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	// 비밀번호 수정 페이지로 이동
	@GetMapping("/pwupdate")
	public String pwupdate(@AuthenticationPrincipal CustomUser customUser, Model model) {
		int membersId = customUser.getMembersId();
		  
	  	// 받아온 ID로 조회
	    MemberVO member = memberService.getMember(membersId);
	    // 모델에 담아서 뷰 반환
	    model.addAttribute("member", member);
	    
	    System.out.println("member : " +member);
	    System.out.println("customUser : " +customUser);
	    return "mypage/pwupdate";
	    }
	
	 // 비밀번호 수정 처리
	@PostMapping("/pwupdate")
		public String savepwupdate(@AuthenticationPrincipal CustomUser customUser,
				HttpSession session, HttpServletRequest request, HttpServletResponse response,
				String password,String newPassword,String newPassword2) {
		
		int membersId = customUser.getMembersId();
		 MemberVO dbVO = memberService.getMember(membersId);
		//1. 현재 비밀번호랑 일치 하는지 
		 if (!passwordEncoder.matches(password, dbVO.getPassword())) {
		    System.out.println("현재 비밀번호가 틀립니다.");
		 }
		 System.out.println("현재 비밀번호가 맞습니다.");
	    //2. 새비밀번호 확인
		 if (newPassword .equals(newPassword2) == false) {
			 System.out.println("새 비밀번호가 틀립니다.");
		 }
		 System.out.println("새 비밀번호가 일치합니다.");
		 //
		 if (password ==null && newPassword == null & newPassword2 ==null) {
	        
		 }
		 //3.디비 업데이트
		 String encoderPw = passwordEncoder.encode(newPassword);
	        memberService.updatePassword(membersId, encoderPw);
		 System.out.println("비밀번호 변경 완료 ");
		 
		 // 4. 로그아웃
		 // session invalidate
		 // cookie delete 
		 session.invalidate();
	 	
		// 해당 구문은 웹에 저장된게 아닌 서버에 저장된 CustomUserData를 제거하는 구문
    	SecurityContextHolder.clearContext(); // 현재 사용자의 인증 정보를 제거
	   
		return "redirect:/security/login";
	
		}
	
	// 회원 탈퇴 페이지로 이동
	@GetMapping("/withdrawal")
	public String withdrawPage(@AuthenticationPrincipal CustomUser customUser, Model model) {
	   
		int membersId = customUser.getMembersId();
	
	  	// 받아온 ID로 조회
	    MemberVO member = memberService.getMember(membersId);
	    // 모델에 담아서 뷰 반환
	    model.addAttribute("member", member);
		
	    return "mypage/withdrawal";
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/withdrawal")
	public String withdrawalForm(@AuthenticationPrincipal CustomUser customUser,String password) {
		int membersId = customUser.getMembersId();
		 MemberVO dbVO2 = memberService.getMember(membersId);
		//1. 현재 비밀번호랑 일치 하는지 
		 if (!passwordEncoder.matches(password, dbVO2.getPassword())) {
		    System.out.println("현재 비밀번호가 틀립니다.");
		 }
		 System.out.println("현재 비밀번호가 맞습니다.");
		
	   //2.디비에서 삭제
		 memberService.withdrawalAuth(membersId);
		 memberService.withdrawalMember(membersId);
		// 3. 로그아웃
		SecurityContextHolder.clearContext(); // 현재 사용자의 인증 정보를 제거
	    return "redirect:/map"; // 탈퇴 후 홈페이지로 리다이렉트
	}

}
