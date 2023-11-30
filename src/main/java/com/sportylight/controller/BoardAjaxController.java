package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.IdVO;
import com.sportylight.service.GatherService;

import retrofit2.http.POST;

@RestController
@RequestMapping("/api/board")
public class BoardAjaxController {
	
	@Autowired
	GatherService service;
	
	@GetMapping("/mylist")
	public List<GatherVO> MyUploadList(@RequestParam int membersId) {

		return service.getMyList(membersId);
	}
	
	@GetMapping("/mystate")
	public List<GatherVO> MyStateList(@RequestParam int membersId) {

		return service.getMyState(membersId);
	}
//	@GetMapping("/joincount")
//	public List<GatherVO> getJoinCount(@RequestParam int membersId) {
//
//		return service.getJoinCount(membersId);
//	}
	
	@GetMapping("/remove")
	public void remove (@RequestParam int gatheringId) {
		service.remove(gatheringId);
	} 
	
	@GetMapping("/delete")
	public void deleteMyState (int gatheringId, int membersId) {
		service.deleteMyState(gatheringId, membersId);
	}

	@PostMapping("/getstate")
	public int getState(@RequestBody IdVO id) {
		return service.getState(id.getGatheringId(),id.getMembersId());
	}
	

}
