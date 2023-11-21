package com.sportylight.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MessageVO {
	private int no;
	private String memberId;
	private int srNo;
	private String chatContent;
	private Date sendDate;
	
	private String validYN;
}
