package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportylight.domain.GatherVO;
import com.sportylight.service.GatherService;

@Controller
public class HomeController {

	@Autowired
	private GatherService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String Home(Model model) {
		List<GatherVO> vo = service.getList();
		
		System.out.println(vo);
		
		model.addAttribute("GatherList", vo);
		model.addAttribute("count", vo.size());
		
		return "home/home";
	}
	

}
