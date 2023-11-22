package com.sportylight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.MemberVO;
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
	    public void myPage(@AuthenticationPrincipal CustomUser customUser, Model model) {
		  	int membersId = customUser.getMembersId();
		  
		  	// 받아온 ID로 조회
	        MemberVO member = memberService.getMember(membersId);
	        // 모델에 담아서 뷰 반환
	        model.addAttribute("member", member);
//	        model.addAttribute("newPassword", new MemberVO()); // 새로운 비밀번호를 받기 위한
//	        return "mypage/mypage";
	    }

	    // 회원 정보 수정 페이지로 이동
	    @GetMapping("/update")
	    public String update(@AuthenticationPrincipal CustomUser customUser, Model model) {
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
	    	public String saveupdate(@AuthenticationPrincipal CustomUser customUser,
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
	    	 //3.디비 업데이트
	    	 String encoderPw = passwordEncoder.encode(newPassword);
	            memberService.updatePassword(membersId, encoderPw);
	    	 System.out.println("비밀번호 변경 완료 ");
	       
	    	return "mypage/mypage";

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
	    	 memberService.withdrawalMember(membersId);
	        return "redirect:/"; // 탈퇴 후 홈페이지로 리다이렉트
	    }

}
