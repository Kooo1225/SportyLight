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
	public String Home(Model model) {

		List<GatherVO> vo = service.getList();
		List<GatherVO> vo2 = service.getTopic();
		
		System.out.println(vo);
		
		for(GatherVO top :vo2) {
			log.info("topic gathering" + top);
		}
		
		model.addAttribute("GatherList", vo);
		model.addAttribute("count", vo.size());
		model.addAttribute("topic", vo2);
		
		return "home/home";
	}
	
	@RequestMapping(value = "/gate", method = RequestMethod.GET)
	public String gate(Model model) {
		List<GatherVO> vo = service.getList();
		List<GatherVO> vo2 = service.getTopic();
		int total_joinCount = service.getSumJoin();
		int total_headCount = service.getSumHead();
		
		model.addAttribute("GatherList", vo);
		model.addAttribute("count", vo.size());
		model.addAttribute("topic", vo2);
		model.addAttribute("total_joinCount", total_joinCount);
		model.addAttribute("total_headCount", total_headCount);
		
		return "home/gate";
	}
}
