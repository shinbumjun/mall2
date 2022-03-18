package com.gura.spring.users;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public boolean isExist(String inputId) {
		String id=session.selectOne("users.isExist", inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert",dto);
	}

	@Override
	public UsersDto getData(String id) {
		return session.selectOne("users.getData", id);
	}

	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.pwdUpdate", dto);
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete",id);
	}

	@Override
	public List<UsersDto> userList(UsersDto dto) {
		return session.selectList("users.userList", dto);
	}

	@Override
	public int getCount(UsersDto dto) {
		
		return session.selectOne("users.getCount",dto);
	}

	@Override
	public void delete2(String id) {
		session.delete("users.delete",id);
	}

	@Override
	public void upgrade(String id) {
		session.update("users.upgrade", id);
	}

}
