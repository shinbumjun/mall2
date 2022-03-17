package com.gura.spring.users;

import javax.servlet.http.HttpSession;

import com.gura.spring.users.UsersDto;

public interface UsersService {
	
	public void addUser(UsersDto dto);
	public void loginProcess(UsersDto dto, HttpSession session);
}
