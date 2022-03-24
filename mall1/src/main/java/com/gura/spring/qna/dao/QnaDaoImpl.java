package com.gura.spring.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.qna.dto.QnaDto;


@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSession session;

	@Override
	public List<QnaDto> getList(QnaDto dto) {
		
		return session.selectList("qna.getList", dto);
	}

	@Override
	public int getCount(QnaDto dto) {
		
		return session.selectOne("qna.getCount", dto);
	}

	@Override
	public int insert(QnaDto dto) {
		return session.insert("qna.insert", dto);
	}

	@Override
	public QnaDto getData(int num) {
		
		return session.selectOne("qna.getData", num);
	}

	@Override
	public QnaDto getData(QnaDto dto) {
		return null;
		//return session.selectOne("qna.getData", dto.getNum());
	}

	@Override
	public void addViewCount(int num) {
		
		session.update("qna.addViewCount", num);
		
	}

	@Override
	public void delete(int num) {
		
		session.delete("qna.delete", num);
		
	}

	@Override
	public void update(QnaDto dto) {
		
		session.update("qna.update", dto);
		
	}

}
