package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.domain.GatherVO;
import com.sportylight.domain.IdVO;
import com.sportylight.service.GatherService;

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
	
	@PostMapping("/getstate")
	public int getState(@RequestBody IdVO id) {
		return service.getState(id.getGatheringId(),id.getMembersId());
	}
	
}
