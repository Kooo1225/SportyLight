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
import com.sportylight.domain.MessageVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class})
@Log4j
public class ChattingMapperTest {

	@Autowired
	private ChattingMapper mapper;
	
	@Test
	public void test() {
		List<MessageVO> vo = mapper.beforeChatRead(1);

		log.info(vo);
	}

}
