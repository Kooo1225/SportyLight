package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.domain.GatherVO;
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
	
}
