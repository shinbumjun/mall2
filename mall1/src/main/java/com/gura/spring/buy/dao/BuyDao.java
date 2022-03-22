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
	public void refund(BuyDto dto);
	public BuyDto getData2(int num);
	public List<BuyDto> refundList(BuyDto dto);
	public void rfDelete(int num);
	public void rePoint(UsersDto dto);
	public int getrfCount(BuyDto dto);
	public BuyDto rfData(int num);
}
