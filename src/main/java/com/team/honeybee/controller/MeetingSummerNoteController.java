package com.team.honeybee.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.team.honeybee.service.MeetingSummerNoteService;

@Controller
public class MeetingSummerNoteController {
	
	@Autowired
	private MeetingSummerNoteService service;
	
	
	// 내꺼 aws String myAwsS3 = "https://bucket0207-0811.s3.ap-northeast-2.amazonaws.com";
	
	// 팀장님
	private final String awsS3Url = "https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/"; 
	
	@ResponseBody
	@PostMapping(value="uploadSummernoteMeetingImageFile", produces = "application/json; charset=utf8")
	public String uploadSummernoteMeetingImageFile(@RequestParam("image") MultipartFile multipartImage,
			@RequestParam("folderId") String folderId, Principal principal, HttpServletRequest request) {
		System.out.println(folderId);
		System.out.println(principal);
		System.out.println(multipartImage);
		
		JsonObject jsonObject = new JsonObject();
		
		String imageUrl = service.uploadSummernoteMeetingImageFile(multipartImage, folderId, principal.getName());
		
		jsonObject.addProperty("url", awsS3Url + imageUrl);
		System.out.println("제이슨 : " + jsonObject.toString());
		return jsonObject.toString();
	}
}
