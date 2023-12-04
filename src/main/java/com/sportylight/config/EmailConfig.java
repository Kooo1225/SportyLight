package com.sportylight.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfig {
	
	@Bean
	public JavaMailSender JavaMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		
		javaMailSender.setHost("smtp.gmail.com");
		javaMailSender.setPort(587);
		javaMailSender.setUsername("sportylight4@gmail.com");
		javaMailSender.setPassword("bksworcavkgoaaen"); 
		javaMailSender.setDefaultEncoding("utf-8");
		javaMailSender.setJavaMailProperties(getMailProperties());

	    return javaMailSender;
	}
	
	private Properties getMailProperties() {
		Properties properties = new Properties();
		
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.smtp.auth", "true");
		properties.setProperty("mail.smtp.starttls.enable", "true");
		properties.setProperty("mail.debug", "true");
		properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

	    return properties;
	}
}	
