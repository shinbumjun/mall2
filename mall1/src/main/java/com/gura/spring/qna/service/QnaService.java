package com.gura.spring.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.gura.spring.qna.dto.QnaCommentDto;
import com.gura.spring.qna.dto.QnaDto;

public interface QnaService {
	
	public void getList(HttpServletRequest request, HttpSession session);
	public void getDetail(HttpServletRequest request, HttpSession session);
	public int saveContent(QnaDto dto);
	public void updateContent(QnaDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request);
	public void qna_reply_insert(QnaDto dto);
	void qna_reply_insert(QnaVO vo);
	public void saveComment(HttpServletRequest request);//댓글 저장 
	public void deleteComment(HttpServletRequest request);//댓글 삭제
	public void updateComment(QnaCommentDto dto);//댓글 수정
	public void moreCommentList(HttpServletRequest request);//댓글 추가 응답
}
