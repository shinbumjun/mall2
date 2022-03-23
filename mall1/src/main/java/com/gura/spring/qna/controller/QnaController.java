package com.gura.spring.qna.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gura.spring.users.UsersServiceImpl;

import com.gura.spring.users.UsersDto;
import com.gura.spring.qna.dto.QnaCommentDto;
import com.gura.spring.qna.dto.QnaDto;
import com.gura.spring.qna.service.QnaService;
import com.gura.spring.qna.service.QnaServiceImpl;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	@RequestMapping("/qna/list")
	public String getList(HttpServletRequest request, HttpSession session) {
		
		service.getList(request, session);
		
		return "qna/list";
	}

	@RequestMapping("/qna/insertform")
	public String insertForm() {
		
		return "qna/insertform";
	}
	
	
	@RequestMapping(value = "/qna/insert", method = { RequestMethod.POST })
	public String insert(QnaDto dto, HttpSession session) {
		//글 작성자는 세션에서 얻어낸다. 
		String id=(String)session.getAttribute("id");
		//객체에 글 작성자도 담기
		dto.setWriter(id);
		service.saveContent(dto);

		return "qna/insert";
	}

	@RequestMapping("/qna/delete")
	public String delete(@RequestParam int num, HttpServletRequest request) {

		service.deleteContent(num, request);

		return "redirect:/qna/list.do";
	}
	
	@RequestMapping("/qna/updateform")
	public String updateForm(HttpServletRequest request) {

		service.getData(request);

		return "qna/updateform";
	}
	
	@RequestMapping(value = "/qna/update", method = RequestMethod.POST)
	public String update(QnaDto dto) {
		service.updateContent(dto);
		return "qna/update";
	}	
	
	@RequestMapping("/qna/detail")
	public String detail(HttpServletRequest request, HttpSession session) {
		
		service.getDetail(request ,session);
		return "qna/detail";
	}
	
	@RequestMapping("/qna/reply")
	public String reply(HttpServletRequest request) {

		service.getData(request);
		
		return "qna/reply";
	} //reply()
	

//새로운 댓글 저장 요청 처리
	@RequestMapping("/qna/private/comment_insert")
	public String commentInsert(HttpServletRequest request, 
			@RequestParam int ref_group) {

		service.saveComment(request);

		return "redirect:/qna/detail.do?num="+ref_group;
	}
	//댓글 더보기 요청 처리
	@RequestMapping("/qna/ajax_comment_list")
	public String ajaxCommentList(HttpServletRequest request) {

		service.moreCommentList(request);

		return "qna/ajax_comment_list";
	}
	//댓글 삭제 요청 처리
	@RequestMapping("/qna/private/comment_delete")
	@ResponseBody
	public Map<String, Object> commentDelete(HttpServletRequest request) {
		service.deleteComment(request);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	//댓글 수정 요청처리 (JSON 을 응답하도록 한다)
	@RequestMapping("/qna/private/comment_update")
	@ResponseBody
	public Map<String, Object> commentUpdate(QnaCommentDto dto){
		service.updateComment(dto);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("isSuccess", true);
		// {"isSuccess":true} 형식의 JSON 문자열이 응답되도록 한다. 
		return map;
	}
	}
	
