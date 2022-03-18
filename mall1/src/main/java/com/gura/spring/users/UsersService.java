package com.gura.spring.users;

import java.util.Map;

import javax.servlet.http.HttpSession;


public interface UsersService {
	
	public void addUser(UsersDto dto);
	public void loginProcess(UsersDto dto, HttpSession session);
	public Map<String, Object> isExistId(String inputId);
}
