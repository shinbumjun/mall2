package com.gura.spring;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.users.UsersDto;
import com.gura.spring.users.UsersService;


@Controller
public class HomeController {

	@Autowired
	private UsersService service;
	
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request,HttpSession session, ModelAndView mView) {
		//DB 에서 읽어온 공지사항이라고 가정하자 
		List<String> notice=new ArrayList<String>();
		notice.add("쇼핑몰입니다");
		//공지 사항을 request 에 담기
		request.setAttribute("notice", notice);
		//view 페이지 (jsp페이지) 로 forward 이동해서 응답 
		
		 if(session.getAttribute("id") !=null) {
			 	//세션이 존재할 때만 
			 	String id=(String)session.getAttribute("id");
			 	//아이디 정보 받아옴
				service.getInfo(session, mView);
		    } 
		mView.setViewName("home");
		return mView;

	}
}





