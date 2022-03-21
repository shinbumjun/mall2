package com.gura.spring.buy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.buy.dto.BuyDto;
import com.gura.spring.movie.dto.MovieDto;

@Repository
public class BuyDaoImpl implements BuyDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<BuyDto> buyList(BuyDto dto) {
		return session.selectList("buy.buyList", dto);
	}

	@Override
	public int getCount(BuyDto dto) {
		return session.selectOne("buy.getCount",dto);
	}

	@Override
	public void insert(BuyDto dto) {
		session.insert("buy.insert",dto);
	}

	@Override
	public void delete(int num) {
		session.delete("buy.delete",num);
	}

	@Override
	public BuyDto getData(int num) {
		return session.selectOne("buy.getData", num);
	}
	
	

}
