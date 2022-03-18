package com.gura.spring.notice.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.gura.spring.notice.dto.NoticeDto;



public interface NoticeService {
	
	public void getList(HttpServletRequest request, HttpSession session);
	public void getDetail(HttpServletRequest request);
	public int saveContent(NoticeDto dto);
	public void updateContent(NoticeDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
	
	
}