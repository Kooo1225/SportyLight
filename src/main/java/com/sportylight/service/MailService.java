package com.sportylight.service;

import javax.mail.MessagingException;

import org.springframework.stereotype.Service;

@Service
public interface MailService {
	
	public String getKey(int size, boolean lowerCheck);
	
	public String init();
	
	public int sendMail(String email);
	
	public void sendPasswordMail(String email, String tempKey);
}
