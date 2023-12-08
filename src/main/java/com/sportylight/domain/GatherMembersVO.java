package com.sportylight.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GatherMembersVO {
	private int gatheringId;
	private int membersId;
	private int state;
}
