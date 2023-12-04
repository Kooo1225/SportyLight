package com.sportylight.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sportylight.config.RootConfig;
import com.sportylight.config.SecurityConfig;
import com.sportylight.domain.ContestVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class})
@Log4j
public class ContestMapperTest {
	
	@Autowired 
	private ContestMapper mapper;
	
	@Test
	public void testGetList() {
		List<ContestVO> contest = mapper.getList();
		
		for(ContestVO vo : contest) {
			log.info(vo);
		}
	}
}
