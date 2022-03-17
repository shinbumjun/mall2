package com.gura.spring.users;

import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.users.UsersService;


@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;

	@RequestMapping("/users/loginform")
	public String loginform() {
	
		return "/users/loginform";
	}
	
	@RequestMapping("/users/login")
	public ModelAndView login(ModelAndView mView, UsersDto dto, String url, HttpSession session) {
		
		service.loginProcess(dto, session);
		String encodedUrl=URLEncoder.encode(url);
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		mView.setViewName("users/login");
		
		return mView;
	}
	
	@RequestMapping("/users/signupform")
	public String signupform() {
	
		return "/users/signupform";
		
	}	

	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(ModelAndView mView, UsersDto dto) {
		
		service.addUser(dto);
		mView.setViewName("users/signup");
		return mView;
	}

	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		//세션에서 id 라는 키값으로 저장된 값 삭제 
		session.removeAttribute("id");
		return "redirect:/home.do";
	}

}


