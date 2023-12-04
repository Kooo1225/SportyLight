package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportylight.domain.ContestVO;
import com.sportylight.service.ContestService;

@Controller
@RequestMapping("/contest")
public class ContestController {
	@Autowired
	private ContestService contestService;
	
	@GetMapping("/list")
	public void contest(Model model) {
		
		List<ContestVO> contest = contestService.getList();
		
		model.addAttribute("contest", contest);
	}
}
