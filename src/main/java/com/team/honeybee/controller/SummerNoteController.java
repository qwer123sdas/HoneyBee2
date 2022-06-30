package com.team.honeybee.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.team.honeybee.service.SummerNoteService;

@Controller
@RequestMapping("uploadImageToS3ForSummerNote")
public class SummerNoteController {
	@Autowired
	SummerNoteService service;
	
	private final String awsS3Url = "https://bucket0207-4885.s3.ap-northeast-2.amazonaws.com/"; // 팀장님꺼
	//"https://bucket0207-spring0520-teacher-test.s3.ap-northeast-2.amazonaws.com/"; // 내꺼
	
	
	//Donation------------------------------------------------------------
	@PostMapping(value="donation",  produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadImageToS3ForSummerNoteFromDonation(@RequestParam("image") MultipartFile multipartImage,
															@RequestParam("folderId") String folderId,
																					Principal principal, 
																					HttpServletRequest request) {
		
		JsonObject jsonObject = new JsonObject();
		String imageUrl = service.uploadImageToS3ForSummerNote(multipartImage, folderId, principal.getName());
		jsonObject.addProperty("url", awsS3Url + imageUrl);
		
		return jsonObject.toString();
	}
	
	//Talent--------------------------------------------------------------
	// 게시글 작성 중, 이미지 업로드
	@PostMapping(value="talent", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadImageToS3ForSummerNoteFromTalent(@RequestParam("image") MultipartFile multipartImage,
														@RequestParam("folderId") String folderId,
																					Principal principal, 
																					HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		String imageUrl = service.uploadImageToS3ForSummerNoteFromTalent(multipartImage, folderId, principal.getName());
		jsonObject.addProperty("url", awsS3Url + imageUrl);
		
		return jsonObject.toString();
	}
}
