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
import com.team.honeybee.service.SummerNoteService;

@Controller
public class SummerNoteController {
	@Autowired
	SummerNoteService service;
	
	private final String awsS3Url = "https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/"; // 내꺼
	
	@PostMapping(value="uploadImageToS3ForSummerNote",  produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadImageToS3ForSummerNote(@RequestParam("image") MultipartFile multipartImage,
																	Principal principal, 
																	HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		String imageUrl = service.uploadImageToS3ForSummerNote(multipartImage, principal.getName());
		jsonObject.addProperty("url", awsS3Url + imageUrl);
		
		return jsonObject.toString();
	}
}
