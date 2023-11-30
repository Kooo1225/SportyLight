package com.sportylight.domain;

import lombok.Data;

@Data
public class SearchVO {
	private String option;
	private String Keyword;
	
	public String[] getOptionArr() {
		return option == null ? new String[] {} : option.split("");
	}
}
