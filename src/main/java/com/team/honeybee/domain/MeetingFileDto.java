package com.team.honeybee.domain;

import java.util.List;

import lombok.Data;

@Data
public class MeetingFileDto {
	
	private int meetingFileId;
	private int meetingId;
	private List<String> fileName;
	
}