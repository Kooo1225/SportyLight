package com.sportylight.service;

import org.springframework.stereotype.Service;

@Service
public interface MailService {
	
	public int sendMail(String email);
}
