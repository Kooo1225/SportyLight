package com.sportylight.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public int sendMail(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		System.out.println(email);
		String content = "홈페이지를 방문해주셔서 대단히 감사합니다. ( 사실 않감사 )" +
						 "<br><br>" +
						 "인증 번호는 " + checkNum + " 입니다." +
						 "<br>" +
						 "해당 인증 번호를 확인란에 기입하여 주시던가요";
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		
		simpleMessage.setTo(email);
		simpleMessage.setSubject("Test JavaMailSender 2");
		simpleMessage.setText(content);
		
		mailSender.send(simpleMessage);
		
		return checkNum;
	}
}
