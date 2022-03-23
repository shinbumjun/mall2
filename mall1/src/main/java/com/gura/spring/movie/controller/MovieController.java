package com.gura.spring.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.movie.dto.MovieDto;
import com.gura.spring.movie.dao.MovieDao;
import com.gura.spring.movie.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService service;
	@Autowired
	private MovieDao dao;
	
	
	//글 삭제 요청 처리 
	@RequestMapping("/movie/delete")
	public ModelAndView authDelete(@RequestParam int num, HttpServletRequest request) {
		
		service.deleteContent(num, request);
		
		return new ModelAndView("redirect:/movie/list.do");
	}
	
	@RequestMapping("/movie/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request) {
		
		service.getData(request);
		
		return  new ModelAndView("movie/updateform");
	}
	//글 수정 요청 처리 
	@RequestMapping(value = "/movie/update", method = RequestMethod.POST)
	public ModelAndView authUpdate(MovieDto dto, HttpServletRequest request) {
		service.updateContent(dto);
		return new ModelAndView("movie/update");
	}
	
	
	//movie list 페이지로 이동
	@RequestMapping(value = "/movie/list")
	public String getList(HttpServletRequest request,HttpSession session) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request,session);
		
		return "movie/list";
	}
	
	
	//movie 사진 업로드 form 페이지로 이동
	@RequestMapping(value = "/movie/upload_form")
	public ModelAndView authUploadForm(HttpServletRequest request) {
		
		return new ModelAndView("movie/upload_form");
	}
	
	//movie 사진 업로드 & DB 저장
	@RequestMapping(value = "/movie/upload")
	public ModelAndView authUpload(MovieDto dto, HttpServletRequest request) {
		//form 에서 dto 로 데이터 받아옴
		//dto : caption, MultipartFile image 를 가지고 있다.
		//request :  imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		service.saveImage(dto, request);
		
		return new ModelAndView("movie/upload");
	}
	
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/movie/insert")
	public ModelAndView authInsert(MovieDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		
		return new ModelAndView("movie/upload");
	}
	
	//imagePath 구성 X -> dto 로 imagePath 를 받아서 DB 에 저장하기
	@RequestMapping(value = "/movie/ajax_insert")
	@ResponseBody
	public Map<String, Object> authAjaxInsert(MovieDto dto, HttpServletRequest request) {
		//dto : caption, imagePath 가지고 있다.
		//request : dto 에 writer(id) 추가
		service.insert(dto, request);
		Map<String, Object> map=new HashMap<>();
		map.put("isSuccess", true);
		return map;
	}	
	
	//movie 게시글의 num 이 parameter get 방식으로 넘어온다.
	//detail 페이지
	@RequestMapping(value = "/movie/detail", method = RequestMethod.GET)
	public ModelAndView detail(HttpServletRequest request,ModelAndView mView,HttpSession session, @RequestParam int num) {
		//갤러리 detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(request,mView,session, num);
		mView.setViewName("movie/detail");
		
		return mView;
	}
	
}
