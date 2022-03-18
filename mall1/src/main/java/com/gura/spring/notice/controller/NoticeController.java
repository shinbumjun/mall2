package com.gura.spring.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gura.spring.notice.dto.NoticeDto;
import com.gura.spring.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice/list")
	public String getList(HttpServletRequest request, HttpSession session) {
		
		service.getList(request, session);
		
		return "notice/list";
	}

	@RequestMapping("/notice/insertform")
	public String insertForm() {
		
		return "notice/insertform";
	}
	
	//새글 저장 요청 처리 
	@RequestMapping(value = "/notice/insert", method = { RequestMethod.POST })
	public String insert(NoticeDto dto, HttpSession session) {
		
		//System.out.println("!!!!!!!!!!!!!!!!!!!");
		//System.out.println(dto.getTitle());
		//System.out.println(dto.getContent());

		//글 작성자는 세션에서 얻어낸다. 
		//String id=(String)session.getAttribute("id");
		//객체에 글 작성자도 담기
		dto.setWriter("admin");
		dto.setViewCount(0);
		
		service.saveContent(dto);

		return "notice/insert";
	}

	//글 삭제 요청 처리 
	@RequestMapping("/notice/delete")
	public String delete(@RequestParam int num, HttpServletRequest request) {

		service.deleteContent(num, request);

		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("/notice/updateform")
	public String updateForm(HttpServletRequest request) {

		service.getData(request);

		return "notice/updateform";
	}
	
	//글 수정 요청 처리 
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String update(NoticeDto dto) {
		service.updateContent(dto);
		return "notice/update";
	}	
	
	//글 자세히 보기 요청 처리
	@RequestMapping("/notice/detail")
	public String detail(HttpServletRequest request) {
		service.getDetail(request);
		return "notice/detail";
	}






}
