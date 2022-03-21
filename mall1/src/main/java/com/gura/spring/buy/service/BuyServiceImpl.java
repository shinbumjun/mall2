package com.gura.spring.buy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.buy.dao.BuyDao;
import com.gura.spring.buy.dto.BuyDto;
import com.gura.spring.users.UsersDto;

@Service
public class BuyServiceImpl implements BuyService{

	@Autowired
	private BuyDao dao;
	
	@Override
	public void getList(HttpServletRequest request,HttpSession session) {
		final int PAGE_ROW_COUNT=10;
		final int PAGE_DISPLAY_COUNT=5;
		
		int pageNum=1;
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum!=null) {
			pageNum=Integer.parseInt(strPageNum);
		}
		
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		String id=(String) session.getAttribute("id");
		String id2=request.getParameter("writer");
		
		BuyDto dto= new BuyDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setId(id);
		
		List<BuyDto> list=dao.buyList(dto);
		int totalRow=dao.getCount(dto);
		
		int startPageNum = 1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		
		int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		if(endPageNum>totalPageCount) {
			endPageNum=totalPageCount;
		} 
		int num=dto.getNum();
		request.setAttribute("num", num);
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("totalPageNum", totalPageCount);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalRow", totalRow);
		request.setAttribute("id", id);
	}

	@Override
	public void delete_list(int num, HttpServletRequest request) {
		dao.delete(num);
	}

	@Override
	public void getInfo(int num, HttpServletRequest request, ModelAndView mView) {
		BuyDto dto=dao.getData(num);
		mView.addObject("dto",dto);
	}




}
