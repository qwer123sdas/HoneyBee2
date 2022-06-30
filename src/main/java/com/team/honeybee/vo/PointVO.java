package com.team.honeybee.vo;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PointVO {
	private String poinId;
	private String memberId;
	private String type;
	private int point;
	private String comment;
	private String expired;
	
	private LocalDateTime inserted;
}	