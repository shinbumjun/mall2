package com.gura.spring.users;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
		
	}

	@Override
	public UsersDto getData(String id) {
		// 존재하지 않은 아이디면 null 이 리턴된다. 
		return session.selectOne("users.getData", id);
	}

}
