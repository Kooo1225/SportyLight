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
	private int chattingId;
	private int gatheringId;
	private int membersId;

	private String message;
	private Date sendDate;
	
	private String nickName;	
	private String avatarPath;
}
