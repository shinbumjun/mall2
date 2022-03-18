package com.gura.spring.users;


public interface UsersDao {
	public void insert(UsersDto dto);
	public UsersDto getData(String id);
	//인자로 전달된 아이디가 존재 하는지 여부를 리턴하는 메소드 
	public boolean isExist(String inputId);
}
