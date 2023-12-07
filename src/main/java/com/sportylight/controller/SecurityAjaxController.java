package com.sportylight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.domain.MemberVO;
import com.sportylight.service.MailService;
import com.sportylight.service.MemberService;

@RestController
@RequestMapping("/api/security")
public class SecurityAjaxController {

	@Autowired
	private MemberService service;
		
	@Autowired
	private MailService mailService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@PostMapping("/pw")
	public boolean findPw(@RequestBody MemberVO vo) {
		boolean result = service.findPw(vo.getName(), vo.getEmail());
		
		if(result == true) {
			String tempKey = mailService.getKey(8, true);
			
			try {
				mailService.sendPasswordMail(vo.getEmail(), tempKey);
			} catch (Exception e) {
				e.printStackTrace();
			}

			service.updatePassword(service.get2(vo.getEmail()).getMembersId(), passwordEncoder.encode(tempKey));
			System.out.println(tempKey);
			System.out.println(passwordEncoder.matches(tempKey, service.get2(vo.getEmail()).getPassword()));
			
			return result;
		}
		else {
			return false;
		}		
	}
}
