package com.gura.spring.buy.dao;

import java.util.List;

import com.gura.spring.buy.dto.BuyDto;
import com.gura.spring.movie.dto.MovieDto;
import com.gura.spring.users.UsersDto;

public interface BuyDao {

	public List<BuyDto> buyList(BuyDto dto);
	public int getCount(BuyDto dto);
	public void insert(BuyDto dto);
	public BuyDto getData(int num);
	public void delete(int num);
}
