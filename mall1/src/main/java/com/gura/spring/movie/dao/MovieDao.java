package com.gura.spring.movie.dao;

import java.util.List;

import com.gura.spring.movie.dto.MovieDto;

public interface MovieDao {
	//gallery 리스트 가져오기
	public List<MovieDto> getList(MovieDto dto);
	//모든 ROW 의 개수
	public int getCount(MovieDto dto);
	//영화목록에 사진 저장하기
	public void insert(MovieDto dto);
	//pk num 에 해당하는 DB 에서 영화목록 게시글 하나의 data 가져오기
	public MovieDto getData(int num);
	//글 삭제
	public void delete(int num);
	//글 수정
	public void update(MovieDto dto);
	//영화구매 카운트 추가
	public void buyNumCount(MovieDto dto);
}
