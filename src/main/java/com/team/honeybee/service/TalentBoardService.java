package com.team.honeybee.service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team.honeybee.domain.SummerNoteDto;
import com.team.honeybee.domain.TalentBoardDto;
import com.team.honeybee.mapper.TalentBoardMapper;

import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class TalentBoardService {
	@Autowired
	TalentBoardMapper mapper;
	
	// 게시물 리스트 가져오기
	public List<TalentBoardDto> findOrder() {
		return mapper.findOrder();
	}
	
	// 특정 게시물 정보 가져오기
	public TalentBoardDto getBoard(int talentId) {
		return mapper.getBoard(talentId);
	}

	// 게시글 작성하기
	public void setTalentBoard(TalentBoardDto dto) {
		mapper.setTalentBoard(dto);
	}
	
	
}
