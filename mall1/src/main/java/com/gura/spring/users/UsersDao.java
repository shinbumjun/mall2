package com.gura.spring.users;

import java.util.List;

public interface UsersDao {
	public void insert(UsersDto dto);
	public UsersDto getData(String id);
	//인자로 전달된 아이디가 존재 하는지 여부를 리턴하는 메소드 
	public boolean isExist(String inputId);
	public void updatePwd(UsersDto dto);
	public void update(UsersDto dto);
	public void delete(String id);
	public void delete2(String id);
	public List<UsersDto> userList(UsersDto dto);
	public int getCount(UsersDto dto);
	public void upgrade(String id);
}
