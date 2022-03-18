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
	
	//ajax 요청에 대해 Movie 하단 페이징 처리에 필요한 데이터 리턴하는 메소드
	@RequestMapping("/api/movie/paging")
	@ResponseBody
	public Map<String, Object> paging(@RequestParam int pageNum){
		//한 페이지에 몇개씩 표시할 것인지
		final int PAGE_ROW_COUNT=8;
		//하단 페이지를 몇개씩 표시할 것인지
		final int PAGE_DISPLAY_COUNT=5;
		
		//하단 시작 페이지 번호 
		int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
		//하단 끝 페이지 번호
		int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	   
		//전체 row 의 갯수
		int totalRow = dao.getCount();
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
		//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
		if(endPageNum > totalPageCount){
			endPageNum = totalPageCount; //보정해 준다. 
		}
		//json 문자열로 응답할 데이터를 일단 Map 에 담는다.
		Map<String, Object> map=new HashMap<>();
		map.put("startPageNum", startPageNum);
		map.put("endPageNum", endPageNum);
		map.put("totalPageCount", totalPageCount);
		// Map 을 리턴해주면 Map 에 담긴 데이터가 
		// {"startPageNum": x, "endPageNum":x, "totalPageCount":x} 의 json 문자열로 
		// 변환되어서 응답된다. 
		return map;
	}
	
	//ajax 요청에 대해 Movie 목록을 출력할 컨트롤러 메소드 
	@RequestMapping("/api/movie/list")
	@ResponseBody 
	public List<MovieDto> getList2(HttpServletRequest request){
		
		return service.getList2(request);
	}
	
	//movie list 페이지로 이동
	@RequestMapping(value = "/movie/list")
	public String getList(HttpServletRequest request) {
		//view 페이지에 사용될 데이터는 request 영역에 담는다.
		service.getList(request);
		
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
	
	//movie 사진 업로드 form - ajax form
	@RequestMapping(value = "/movie/ajax_form")
	public ModelAndView authAjaxForm(HttpServletRequest request) {
		
		return new ModelAndView("movie/ajax_form");
	}

	//movie 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/movie/ajax_upload")
	@ResponseBody
	public Map<String, Object> authAjaxUpload(MovieDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
	}
	
	//movie 사진 업로드 - ajax
	//json 으로 return 할 것
	@RequestMapping(value = "/movie/ajax_upload2")
	@ResponseBody
	public Map<String, Object> testAjaxUpload2(MovieDto dto, HttpServletRequest request){		
		//form 에서 dto 로 데이터 받아옴
		//dto : MultipartFile image 를 가지고 있다.
		//request : imagePath 만드는데 사용, session 영역의 id 가져오는데 사용
		//return : { "imagePath" : "/upload/123456img_name.png" } 형식의 JSON 응답
		return service.uploadAjaxImage(dto, request);
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
	public ModelAndView detail(ModelAndView mView,HttpSession session, @RequestParam int num) {
		//갤러리 detail 페이지에 필요한 data를 num 으로 가져와, ModelAndView 에 저장
		service.getDetail(mView,session, num);
		mView.setViewName("movie/detail");
		
		return mView;
	}
	
}
