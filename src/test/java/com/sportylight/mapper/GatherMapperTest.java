package com.sportylight.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sportylight.config.EmailConfig;
import com.sportylight.config.RootConfig;
import com.sportylight.config.SecurityConfig;
import com.sportylight.domain.CategoryEnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, SecurityConfig.class, EmailConfig.class })
@Log4j
public class GatherMapperTest {

	@Autowired
	private GatherMapper mapper;
	
	public void testSearch() {
		SearchVO search = new SearchVO();
		
		search.setKeyword("갈비찜");
		search.setOption("TC");
		
		List<GatherVO> list = mapper.getSearch(search);
		
		for(GatherVO gather: list) {
			log.info(gather);
		}
	}
	
	@Test
	public void testRegion() {
		List<GatherVO> vo = mapper.getRegionList("경기");
		
		log.info(vo);
		log.info(vo.size());
	}
	
}


