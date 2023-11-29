package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportylight.domain.GatherVO;
import com.sportylight.service.GatherService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private GatherService service;
	
	@GetMapping("/mylist")
	public void mylist(int membersId, Model model) {
		log.info("mylist");
		
		List<GatherVO> mylist = service.getMyList(membersId);
		
		
		model.addAttribute("membersId", membersId);
		model.addAttribute("mylist", mylist);
		
		
	}
	
	@GetMapping("/mystate")
	public void mystate(int membersId, Model model) {
		log.info("mystate");
		
		
		List<GatherVO> mystate = service.getMyState(membersId);
		
		model.addAttribute("membersId", membersId);
		model.addAttribute("mystate", mystate);
		
	}
	
	@GetMapping("/register")
	public void register() {
		log.info("register");
	}
	
	@PostMapping("/register")
	public String register(@ModelAttribute("vo") GatherVO vo, RedirectAttributes rttr) {
        
		service.register(vo);
		
		rttr.addFlashAttribute("result", vo.getGatheringId());
		
		return "redirect:/";
	}
	
	@GetMapping("/detail")
	public void registerDetail( @RequestParam("gatheringId") int gatheringId, Model model) {
		
		model.addAttribute("gather", service.get(gatheringId));
	}
	
}
