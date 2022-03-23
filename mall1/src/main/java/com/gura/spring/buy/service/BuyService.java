package com.gura.spring.buy.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.buy.dto.BuyDto;
import com.gura.spring.users.UsersDto;

public interface BuyService {

	public void getList(HttpServletRequest request, HttpSession session); 
	public void delete_list(int num, HttpServletRequest request);
	public void getInfo(int num, HttpServletRequest request, ModelAndView mView);
	public void refund_add(int num, HttpServletRequest request, ModelAndView mView);
	public void refundList(HttpServletRequest request);
	public void rfDelete(int num, HttpServletRequest request, UsersDto Udto, BuyDto dto );
	public void rfCheck(int num,HttpServletRequest request);
}
