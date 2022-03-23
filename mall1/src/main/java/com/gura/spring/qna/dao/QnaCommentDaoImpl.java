package com.gura.spring.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.qna.dto.QnaCommentDto;

@Repository
public class QnaCommentDaoImpl implements QnaCommentDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<QnaCommentDto> getList(QnaCommentDto dto) {
		return session.selectList("qnaComment.getList", dto);
	}

	@Override
	public void delete(int num) {	
		session.update("qnaComment.delete", num);
	}

	@Override
	public void insert(QnaCommentDto dto) {
		session.insert("qnaComment.insert", dto);
	}

	@Override
	public int getSequence() {
		return session.selectOne("qnaComment.getSequence");
	}

	@Override
	public void update(QnaCommentDto dto) {
		session.update("qnaComment.update", dto);
	}

	@Override
	public QnaCommentDto getData(int num) {
		return session.selectOne("qnaComment.getData", num);
	}

	@Override
	public int getCount(int ref_group) {
		return session.selectOne("qnaComment.getCount", ref_group);
	}

}
