package com.sportylight.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sportylight.config.RootConfig;
import com.sportylight.domain.GatherVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class GatherServiceTest {

	@Autowired
	GatherService service;
	
//	@Test
//	public void test() {
//		List<GatherVO> vo = service.getMyList(1);
//		
//		log.info(vo);
//	}
	
	@Test
	public void test2() {
		service.deleteMyState(65, 54);
	}
}
