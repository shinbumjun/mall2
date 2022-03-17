package com.gura.spring.notice.dao;

import java.util.List;
import com.gura.spring.notice.dto.NoticeDto;

public interface NoticeDao {

	//글목록
	public List<NoticeDto>getList(NoticeDto dto);
	//글의 갯수
	public int getCount(NoticeDto dto);
	//글 추가
	public int insert(NoticeDto dto);
	//글정보 얻어오기
	public NoticeDto getData(int num);
	//키워드를 활용한 글정보 얻어오기
	public NoticeDto getData(NoticeDto dto);
	//조회수 증가 시키기
	public void addViewCount(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(NoticeDto dto);
}


