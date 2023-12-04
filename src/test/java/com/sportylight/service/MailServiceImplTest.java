package com.sportylight.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sportylight.config.EmailConfig;
import com.sportylight.config.RootConfig;
import com.sportylight.config.SecurityConfig;
import com.sportylight.mapper.ChattingMapperTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, EmailConfig.class})
@Log4j
public class MailServiceImplTest {

	@Autowired
	private MailServiceImpl service;
	
	@Test
	public void test() {
		service.sendMail("kooo1225@naver.com");
	}

}
