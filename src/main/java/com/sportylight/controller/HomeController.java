package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;
import com.sportylight.service.GatherService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class HomeController {

	@Autowired
	private GatherService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gate(Model model) {
		List<GatherVO> vo = service.getList();
		List<GatherVO> vo2 = service.getTopic();
		int totalJoinCount = service.getSumJoin();
		int totalHeadCount = service.getSumHead();
		List<GatherVO> seoulList = service.getRegionCount("서울");
		List<GatherVO> gyunggiList = service.getRegionCount("경기");
		List<GatherVO> busanList = service.getRegionCount("부산");
		List<GatherVO> daeguList = service.getRegionCount("대구");
		
		model.addAttribute("GatherList", vo);
		model.addAttribute("count", vo.size());
		model.addAttribute("topic", vo2);
		model.addAttribute("totalJoinCount", totalJoinCount);
		model.addAttribute("totalHeadCount", totalHeadCount);
		model.addAttribute("seoul", seoulList.size());
		model.addAttribute("gyunggi", gyunggiList.size());
		model.addAttribute("busan", busanList.size());
		model.addAttribute("daegu", daeguList.size());
		
		return "home/gate";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model model) {
		List<GatherVO> vo = service.getList();
		List<GatherVO> vo2 = service.getTopic();
		
		for(GatherVO top :vo2) {
			log.info("topic gathering" + top);
		}
		
		model.addAttribute("GatherList", vo);
		model.addAttribute("count", vo.size());
		model.addAttribute("topic", vo2);
		
		return "home/home";
	}
}
