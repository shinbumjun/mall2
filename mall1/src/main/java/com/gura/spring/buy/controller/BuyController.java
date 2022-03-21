package com.gura.spring.buy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.buy.service.BuyService;

@Controller
public class BuyController {

	@Autowired
	private BuyService service;
	
	@RequestMapping("/users/private/purchasehistory")
	public String getList(HttpServletRequest request,HttpSession session) {
		service.getList(request, session);
		return "users/purchasehistory";
	}
	
	@RequestMapping("/users/private/delete_list")
	public ModelAndView delete2(@RequestParam int num, ModelAndView mView,HttpServletRequest request) {
		service.delete_list(num, request);
		
		mView.setViewName("redirect:/users/private/purchasehistory.do");
		return mView;
	}	
}
