package com.sportylight.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sportylight.domain.MemberVO;
import com.sportylight.service.MemberService;
import com.sportylight.service.MemberServiceImpl;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@RequestMapping("/security")
@Controller
public class SecurityController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/login")
	public void login() {
		log.info("login page");
	}
	
	@GetMapping("/join")
	public void signup(
			@ModelAttribute("member") MemberVO member) {
	}
	

	@PostMapping("/join")
	public String join(
			@Valid
			@ModelAttribute("member") MemberVO member,
			Errors errors,
			MultipartFile avatar) throws IOException, ServletException{
	
		// 1. 비밀번호, 비밀번호 확인 일치여부
		if(!member.getPassword().equals(member.getPassword2())) {
			//에러 추가
			errors.rejectValue("password2", "비밀번호 불일치", "비밀번호 확인이 일치하지 않습니다.");
		}
		
		// 2. 아이디 중복확인
		if(!errors.hasFieldErrors("email")) { // username 유효성 통과한 경우에
			//DB에서 email을 검사

			if (service.checkEmail(member.getEmail()) != null) { // 중복일 때
				errors.rejectValue("email", "email 중복", "이미 사용중인 email입니다.");
			}
		}

		if (!errors.hasFieldErrors("nickname")) { // username 유효성 통과한 경우에
			// DB에서 nickname을 검사
			if (service.checkNickname(member.getNickname()) != null) { // 중복일 때
				errors.rejectValue("nickname", "nickname 중복", "이미 사용중인 닉네임입니다.");
			}
		}
		
		if(errors.hasFieldErrors()) {
			return "security/join";
		}
		
		// DB에 저장
		service.register(member, avatar); // null
		return "redirect:/";
	}
	
	@GetMapping("/avatar/{size}/{email}")  
	@ResponseBody
	public void avatar(@PathVariable("size") String size,
					@PathVariable("email") String email,
					HttpServletResponse response) throws IOException{
		File src = new File(MemberServiceImpl.AVATAR_UPLOAD_DIR, email + ".png");
		
		
		if(!src.exists()) {//파일이 존재하지 않으면
			src = new File(MemberServiceImpl.AVATAR_UPLOAD_DIR, "unknown.png");
		}
		log.warn(src);
		
		response.setHeader("Content-Type", "image/png");
		
		if(size.equals("sm")) {
			Thumbnails.of(src)
					.size(25, 25)
					.toOutputStream(response.getOutputStream());
		} else {
			Thumbnails.of(src)
					.size(50, 50)
					.toOutputStream(response.getOutputStream());
		}
	}
	
	@GetMapping("/profile")
	public void profile() {
		
	}
}
