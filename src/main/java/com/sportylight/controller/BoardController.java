package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportylight.domain.GatherMembersVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.security.domain.CustomUser;
import com.sportylight.service.GatherService;

import lombok.extern.log4j.Log4j;
import retrofit2.http.GET;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private GatherService service;
	
	@GetMapping("/mylist")
	public void mylist(int membersId, Model model) {
		log.info("mylist");
		
		List<GatherVO> myList = service.getMyList(membersId);
		
		model.addAttribute("membersId", membersId);
		model.addAttribute("myList", myList);
		
		
	}
	
	@GetMapping("/mystate")
	public void mystate(int membersId, Model model) {
		log.info("mystate");
		
		
		List<GatherVO> myState = service.getMyState(membersId);
		
		model.addAttribute("membersId", membersId);
		model.addAttribute("myState", myState);
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
	
//	@GetMapping("/insertApply")
//	public void insertApply() {
//		log.info("insertApply");
//	}
	
	@GetMapping("/insertApply")
	public String insertApply(@ModelAttribute("vo") GatherMembersVO vo, RedirectAttributes rttr) {
		
		service.insertApply(vo);
		
		return"redirect:/board/detail?gatheringId=" + vo.getGatheringId();
	}
	
	@GetMapping("/detail")
	public void registerDetail(@AuthenticationPrincipal CustomUser customUser, @RequestParam("gatheringId") int gatheringId, Model model) {	
		model.addAttribute("state", service.getState(gatheringId, customUser.getMembersId()));
		model.addAttribute("gather", service.get(gatheringId));
	}

	@GetMapping("/modify")
	public void modify(
			@RequestParam("gatheringId") int gatheringId,
			Model model) {
		
		model.addAttribute("gather", service.get(gatheringId));
	}
	
	@PostMapping("/modify")
	public String modify(
		GatherVO vo,
		RedirectAttributes rttr) {
		
		log.info("modify:" + vo);
		
		if (service.modify(vo)) {
			// Flash --> 1회성으로 정보를 전달한다.
			rttr.addFlashAttribute("result", "success");
			
		}
		
		return "redirect:/board/mylist?membersId=" + vo.getMembersId();
	}
	
	@GetMapping("/remove")
	public void remove (@RequestParam int gatheringId, Model model) {
		
		log.info("remove : " + gatheringId);
		model.addAttribute("gatheringId", gatheringId);
		service.remove(gatheringId);
	}
	
	@GetMapping("/delete")
	public String delete(
			int gatheringId, int membersId,
			RedirectAttributes rttr) {
	
		log.info("delete..." + gatheringId + ", " + membersId);
		
		if (service.deleteMyState(gatheringId, membersId)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/mylist?membersId=" + membersId;

	}
	
	@GetMapping("/manage")
	public void manage(int membersId, Model model) {
		log.info("mylist");
		
		List<GatherVO> myList = service.getMyList(membersId);
		
		model.addAttribute("membersId", membersId);
		model.addAttribute("myList", myList);
		
		
	}
	
}
