package com.team.honeybee.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.team.honeybee.domain.*;
import com.team.honeybee.service.*;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("signup")
	public void signupForm() {
		
	}
	@RequestMapping("index") 
	public void index() {
		
	}
	
	
	@PostMapping("signup")
	public void signupProcess(MemberDto member) {
		boolean success = service.addMember(member);
		
		if(success) {
			
		} else {
			
		}
	}
}
