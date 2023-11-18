package com.sportylight.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.sportylight.service.MemberService;

@Controller
@RequestMapping("/mypage")

public class MemberController {

	@Autowired
	private MemberService memberService;

	  @GetMapping
	    public String myPage(@RequestParam("membersId") String membersId, Model model) {
	        // 받아온 ID로 조회
	        MemberVO member = memberService.getMember(membersId);
	        // 모델에 담아서 뷰 반환
	        model.addAttribute("member", member);
	        model.addAttribute("newPassword", new MemberVO()); // 새로운 비밀번호를 받기 위한
	        return "mypage/mypage";
	    }

	    // 회원 정보 수정 페이지로 이동
	    @GetMapping("/update")
	    public String update(@RequestParam("membersId") String membersId, Model model) {
	        // 받아온 ID로 조회
	        MemberVO member = memberService.getMember(membersId);
	        // 모델에 담아서 뷰 반환
	        model.addAttribute("member", member);
	        return "mypage/mypageupdate";
	    }

	    // 회원 정보 수정 처리
	    @PostMapping("/update")
	    public String saveupdate(@ModelAttribute MemberVO updatedMember, Errors errors, Model model) {
	    	// 새로운 비밀번호가 비어있지 않고, 비밀번호 확인이 일치하지 않을 때 에러 처리
	    	if ((updatedMember.getPassword() != null && !updatedMember.getPassword().equals(updatedMember.getPassword2()))
	    	        || (updatedMember.getPassword2() != null && !updatedMember.getPassword2().isEmpty())) {
	    	    errors.rejectValue("password2", "password.mismatch", "비밀번호 확인이 일치하지 않습니다.");
	    	    return "mypage/mypageupdate";
	    	}

	        // 에러가 있을 경우 회원 정보 수정 페이지로
	        if (errors.hasErrors()) {
	            return "mypage/mypageupdate";
	        }

	        // 새로운 비밀번호가 비어있지 않으면 비밀번호 변경
	        if (!updatedMember.getPassword().isEmpty()) {
	            memberService.updateMember(updatedMember);
	        }
	        return "redirect:/mypage?membersId=" + updatedMember.getMembersId();
	    }

	    // 회원 탈퇴 페이지로 이동
	    @GetMapping("/withdrawl")
	    public String withdrawPage(@RequestParam("membersId") String membersId, Model model) {
	        MemberVO member = memberService.getMember(membersId);
	        model.addAttribute("member", member);
	        return "mypage/withdrawl";
	    }

	    // 회원 탈퇴 처리
	    @PostMapping("/withdrawl")
	    public String withdraw(@RequestParam("membersId") String membersId) {
	        memberService.withdrawlMember(membersId);
	        return "redirect:/"; // 탈퇴 후 홈페이지로 리다이렉트
	    }

}
