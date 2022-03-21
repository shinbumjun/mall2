package com.gura.spring.review.service;

import javax.servlet.http.HttpServletRequest;

import com.gura.spring.review.dto.ReviewCommentDto;
import com.gura.spring.review.dto.ReviewDto;

public interface ReviewService {
	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(ReviewDto dto);
	public void updateContent(ReviewDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void saveComment(HttpServletRequest request);//댓글 저장 
	public void deleteComment(HttpServletRequest request);//댓글 삭제
	public void updateComment(ReviewCommentDto dto);//댓글 수정
	public void moreCommentList(HttpServletRequest request);//댓글 추가 응답
	public void getData(HttpServletRequest request); //글 수정하기 위해 정보 불러오는 기능
}
