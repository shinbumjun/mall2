package com.gura.spring.qna.service;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class QnaPage extends PageVO {
	private List<QnaVO> list;

	public List<QnaVO> getList() {
		return list;
	}

	public void setList(List<QnaVO> list) {
		this.list = list;
	}
}