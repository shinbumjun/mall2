package com.gura.spring.users;

import java.util.List;

public interface UsersDao {
	public boolean isExist(String inputId);
	public void insert(UsersDto dto);
	public UsersDto getData(String id);
	public void updatePwd(UsersDto dto);
	public void update(UsersDto dto);
	public void delete(String id);
	public void delete2(String id);
	public List<UsersDto> userList(UsersDto dto);
	public int getCount(UsersDto dto);
	public void upgrade(String id);
}
