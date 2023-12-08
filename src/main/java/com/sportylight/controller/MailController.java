package com.sportylight.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.service.MailService;

@RestController
@RequestMapping("/api/mail")
public class MailController {

	@Autowired
	private MailService service;
	
	
	@GetMapping("/certification")
	public int sendCertNum(@RequestParam String Email) {
		return service.sendMail(Email);
	}
	
}
