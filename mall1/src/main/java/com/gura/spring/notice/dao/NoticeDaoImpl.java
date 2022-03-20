package com.gura.spring.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.notice.dto.NoticeDto;


@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<NoticeDto> getList(NoticeDto dto) {
		
		return session.selectList("notice.getList", dto);
	}

	@Override
	public int getCount(NoticeDto dto) {
		
		return session.selectOne("notice.getCount", dto);
	}

	@Override
	public int insert(NoticeDto dto) {
		return session.insert("notice.insert", dto);
	}

	@Override
	public NoticeDto getData(int num) {
		
		return session.selectOne("notice.getData", num);
	}

	@Override
	public NoticeDto getData(NoticeDto dto) {
		return null;
		//return session.selectOne("notice.getData", dto.getNum());
	}

	@Override
	public void addViewCount(int num) {
		
		session.update("notice.addViewCount", num);
		
	}

	@Override
	public void delete(int num) {
		
		session.delete("notice.delete", num);
		
	}

	@Override
	public void update(NoticeDto dto) {
		
		session.update("notice.update", dto);
		
	}
	
}
