package com.sportylight.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sportylight.config.EmailConfig;
import com.sportylight.config.RootConfig;
import com.sportylight.config.SecurityConfig;
import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.mapper.GatherMapperTest;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, EmailConfig.class })
@Log4j
public class GatherServiceTest2 {

	@Autowired
	private GatherService service;
	
	@Test
	public void test() {
		EnumVO type = EnumVO.valueOf("헬스");
		
		List<GatherVO> vo = service.getTypeList(type, "경남");
		
		log.info(vo);
	}

}
