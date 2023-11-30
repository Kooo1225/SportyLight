package com.sportylight.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sportylight.domain.EnumVO;
import com.sportylight.domain.GatherVO;
import com.sportylight.domain.SearchVO;
import com.sportylight.service.GatherService;

@RestController
@RequestMapping("/api/home")
public class HomeAjaxController {
	
	@Autowired
	public GatherService service;
	
	@GetMapping("/typelist")
	public List<GatherVO> HikingList(@RequestParam String types) {
		EnumVO type = EnumVO.valueOf(types);
	
		return service.getTypeList(type); //데이터를 반환해주어야 함 
	}
	
	@GetMapping("/search")
	@ResponseBody
	public List<GatherVO> search(SearchVO search) {

		List<GatherVO> result = service.getSearch(search);
	    return result;
	}
}
