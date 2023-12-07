package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.GatherMembersVO;
import com.sportylight.service.GatherMembersService;
import com.sportylight.service.GatherService;



@RestController
@RequestMapping("/api/board")
public class BoardAjaxController {
	
	@Autowired
	private GatherService service;
	
	@Autowired
	private GatherMembersService mService;
	
	@GetMapping("/mylist")
	public List<GatherVO> MyUploadList(@RequestParam int membersId) {
		return service.getMyList(membersId);
	}
	
	@GetMapping("/mystate")
	public List<GatherVO> MyStateList(@RequestParam int membersId) {
		return service.getMyState(membersId);
	}
	
	@GetMapping("/remove")
	public void remove (@RequestParam int gatheringId) {
		service.remove(gatheringId);
	} 
	
	@GetMapping("/delete")
	public void deleteMyState (int gatheringId, int membersId) {
		service.deleteMyState(gatheringId, membersId);
	}

	@PostMapping("/getstate")
	public int getState(@RequestBody GatherMembersVO id) {
		return service.getState(id.getGatheringId(),id.getMembersId());
	}
	
	@GetMapping("/insertApply")
	public void insertApply() {
	}
	
	@PostMapping("/insertApply")
	public String insertApply(@ModelAttribute GatherMembersVO vo, RedirectAttributes rttr) {
		
		service.insertApply(vo);
		rttr.addFlashAttribute("result", vo.getGatheringId());
		
		return"redirect:/";
	}

}
