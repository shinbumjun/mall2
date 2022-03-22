package com.gura.spring.movie.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.movie.dto.MovieDto;

public interface MovieService {
	//영화 목록의 list 가져오기
	public void getList(HttpServletRequest request,HttpSession session);
	
	//영화 목록에 사진 upload & DB 저장하기
	public void saveImage(MovieDto dto, HttpServletRequest request);

	//영화 목록에 사진 저장하기 - db에만 저장(upload 작업은 이미 완료)
	public void insert(MovieDto dto, HttpServletRequest request);
	//영화 목록 detail 페이지에 필요한 data를 ModelAndView 에 저장
	public void getDetail(ModelAndView mView,HttpSession session, int num);
	
	public void updateContent(MovieDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request);
	public void buyNumCount(MovieDto dto);
}
