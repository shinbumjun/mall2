package com.gura.spring.buy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.buy.dto.BuyDto;
import com.gura.spring.buy.service.BuyService;
import com.gura.spring.users.UsersDto;

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
	
	@RequestMapping("/users/private/check")
	public String refund(@RequestParam int num, HttpServletRequest request ) {
		service.rfCheck(num, request);
		return "users/check";
	}
	
	@RequestMapping("/users/private/refund")
	public ModelAndView refund3(@RequestParam int num, HttpServletRequest request, ModelAndView mView) {
		service.refund_add(num, request, mView);
		mView.setViewName("redirect:/users/private/purchasehistory.do");
		return mView;
	}
	
	@RequestMapping("/users/private/users_product")
	public String product(HttpServletRequest request) {
		service.refundList(request);
		return "users/users_product";
	}
	
	@RequestMapping("/users/private/refund2")
	public String refund2(int num, HttpServletRequest request, UsersDto Udto, BuyDto dto) {
		service.rfDelete(num, request, Udto, dto);
		return "redirect:/users/private/users_product.do";
	}
}
