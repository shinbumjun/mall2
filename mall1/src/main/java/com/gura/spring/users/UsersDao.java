package com.gura.spring.users;

import com.gura.spring.users.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public UsersDto getData(String id);
}
