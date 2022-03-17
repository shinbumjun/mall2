package com.gura.spring.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.movie.dto.MovieDto;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private SqlSession session;
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : getList
	 * parameterType : MovieDto
	 * resultType : MovieDto
	 */
	//movie 의 모든 리스트 가져오기
	@Override
	public List<MovieDto> getList(MovieDto dto) {
		
		return session.selectList("movie.getList", dto);
	}
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : getCount
	 * resultType : int
	 */
	//row 의 총 개수 구하기
	@Override
	public int getCount() {
		return session.selectOne("movie.getCount");
	}
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : insert
	 * parameterType : MovieDto
	 */
	@Override
	public void insert(MovieDto dto) {
		session.insert("movie.insert", dto);
	}
	
	/*
	 * Mapper's namespace : movie
	 * sql's id : getData
	 * parameterType : int
	 * resultType : MovieDto
	 */
	@Override
	public MovieDto getData(int num) {
		return session.selectOne("movie.getData", num);
	}
	
	@Override
	public void delete(int num) {
		session.delete("movie.delete", num);
	}

	@Override
	public void update(MovieDto dto) {
		session.update("movie.update", dto);
	}
	
}
