package com.gura.spring.qna.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.gura.spring.qna.dto.QnaDto;
import com.gura.spring.qna.service.QnaPage;
import com.gura.spring.qna.service.QnaService;
import com.gura.spring.qna.service.QnaServiceImpl;
import com.gura.spring.qna.service.QnaVO;

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
		dto.setWriter("id");
		dto.setViewCount(0);
		
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
	
	//신규 답글 저장 처리 요청==============================================================
		@RequestMapping("/qna/reply_insert")
		public String reply_insert(QnaDto dto, HttpSession session) {
			dto.setWriter("id");
			
			//화면에서 입력한 정보를 DB에 저장한 후 목록 화면으로 연결
			service.qna_reply_insert(dto);
			return "redirect:/qna/list.do";
		} //reply_insert()
	}
