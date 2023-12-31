package com.sportylight.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.MemberVO;
import com.sportylight.security.domain.CustomUser;
import com.sportylight.domain.GatherMembersVO;
import com.sportylight.service.GatherMembersService;
import com.sportylight.service.GatherService;
import com.sportylight.service.MemberService;

import lombok.extern.log4j.Log4j;
import retrofit2.http.GET;

@Controller
@Log4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private GatherService service;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private GatherMembersService gmService;
	
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
		
		return "redirect:/map";
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
		
		return "redirect:/board/detail?gatheringId=" + vo.getGatheringId();
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
	
	@GetMapping("/manage/{gatheringId}")
	public String manage(@AuthenticationPrincipal CustomUser customUser, @ModelAttribute("gatherMemebers") GatherMembersVO gatherMembers, 
			@PathVariable int gatheringId, Model model) {	
	
		GatherVO gatherVO = service.get(gatheringId);
		List<GatherVO> myGatherList = service.getMyList(customUser.getMembersId());
		List<MemberVO> myMemberList = mService.getManageList(gatheringId);
		List<MemberVO> myNonMemberList = mService.getNonManageList(gatheringId);
		
		model.addAttribute("membersId", customUser.getMembersId());
		model.addAttribute("myGatherList", myGatherList);
		model.addAttribute("myMemberList", myMemberList);
		model.addAttribute("myNonMemberList", myNonMemberList);
		model.addAttribute("gatherVO", gatherVO);
		
		return "board/manage";
	}
	
	@PostMapping("/manage")
	public String manage(int gatheringId, int membersId, int state, Model model) {
		System.out.println("선택된 ID : " + membersId);
		gmService.updateState(gatheringId, membersId, state);
		
		return "redirect:/board/manage/" + gatheringId;
	}
	
//	@PostMapping("/manage/apply")
//	public String apply(GatherMembersVO vo, RedirectAttributes rttr, Model model) {
//		System.out.println("선택된 ID : " + vo.getMembersId());
//		gmService.updateState(vo.getGatheringId(), vo.getMembersId(), vo.getState());
//		System.out.println("apply완료");
//		rttr.addFlashAttribute("gatheringId", vo.getGatheringId());
//		
//		return "redirect:/board/manage";
//	}
	
}
