package com.sportylight.service;

import java.util.Random;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender mailSender;
	
	private MimeMessage mail;
    private MimeMessageHelper mailHelper;
	private boolean lowerCheck;
	private int size;
	
	@Override
	// 길이와 대소문자 
	public String getKey(int size, boolean lowerCheck) {
		this.size = size;
		this.lowerCheck = lowerCheck;
		return init();
	}
	
	@Override
	// 랜덤으로 문자열 생성 
	public String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer(); //문자열을 담기 위한 
		int num  = 0;
		do {
            // ASCII 코드를 이용하여 숫자, 대문자, 소문자 중 하나의 문자를 무작위로 선택
			num = ran.nextInt(75) + 48;
			
            // 선택된 문자가 숫자, 대문자, 소문자 중 하나인 경우에만 추가
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		
        // 대소문자 구분 여부에 따라 반환값을 소문자로 변환할지 여부 결정
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	@Override
	public int sendMail(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		try {
			this.mail = mailSender.createMimeMessage();
			this.mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			
			mailHelper.setSubject("[SportyLight 회원가입 인증번호 입니다.]");
			mailHelper.setText("<h1>인증번호 발급</h1>" +
	              "<br/>" + email + "님 " +
	              "<br/>회원가입을 위한 인증번호 입니다." +
	              "<br/>인증번호 : <h2>" + checkNum + "</h2>" +
	              "<br/>인증번호란에 해당 번호를 기입하고 회원가입을 진행해주세요.", true);
			
			mailHelper.setFrom("sportylight4@gmail.com", "SPORTYLIGHT");
			mailHelper.setTo(email);
			
			mailSender.send(mail);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return checkNum;
	}
	
	@Override
	public void sendPasswordMail(String email, String tempKey) {		
		
		try {
			this.mail = mailSender.createMimeMessage();
			this.mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			
			System.out.println(email);
			
			mailHelper.setSubject("[SportyLight 임시 비밀번호 입니다.]");
			mailHelper.setText("<h1>임시비밀번호 발급</h1>" +
	              "<br/>" + email + "님 " +
	              "<br/>비밀번호 찾기를 통한 임시 비밀번호입니다." +
	              "<br/>임시비밀번호 : <h2>" + tempKey + "</h2>" +
	              "<br/>로그인 후 비밀번호 변경을 해주세요." +
	              "<a href='http://localhost:8080/member/loginView'>로그인 페이지</a>", true);
			
			mailHelper.setFrom("sportylight4@gmail.com", "SPORTYLIGHT");
			mailHelper.setTo(email);
			
			mailSender.send(mail);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
//		return checkNum;
	}
}
