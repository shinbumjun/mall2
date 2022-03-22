package com.gura.spring.qna.dao;

import java.util.List;
import com.gura.spring.qna.dto.QnaDto;

public interface QnaDao {

	//글목록
	public List<QnaDto>getList(QnaDto dto);
	//글의 갯수
	public int getCount(QnaDto dto);
	//글 추가
	public int insert(QnaDto dto);
	//글정보 얻어오기
	public QnaDto getData(int num);
	//키워드를 활용한 글정보 얻어오기
	public QnaDto getData(QnaDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(QnaDto dto);
}
