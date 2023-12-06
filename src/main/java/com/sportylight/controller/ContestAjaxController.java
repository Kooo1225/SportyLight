package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.domain.ContestEnumVO;
import com.sportylight.domain.ContestVO;
import com.sportylight.service.ContestService;

@RestController
@RequestMapping("/api/contest")
public class ContestAjaxController {

	@Autowired
	private ContestService service;
	
	@GetMapping("/type/{title}")
	public List<ContestVO> getTypeList(@PathVariable String title) {
		ContestEnumVO type = ContestEnumVO.valueOf(title);
		
		return service.getTypeList(type);
	}
}
