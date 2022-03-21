package com.gura.spring.buy.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.buy.dto.BuyDto;

public interface BuyService {

	public void getList(HttpServletRequest request, HttpSession session); 
	public void delete_list(int num, HttpServletRequest request);
	public void getInfo(int num, HttpServletRequest request, ModelAndView mView);
}
