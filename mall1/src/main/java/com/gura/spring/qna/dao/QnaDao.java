package com.gura.spring.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.spring.qna.service.QnaPage;
import com.gura.spring.qna.service.QnaService;
import com.gura.spring.qna.service.QnaVO;

@Repository
public class QnaDao implements QnaService {
	@Autowired private SqlSession sql;

	@Override
	public void qna_insert(QnaVO vo) {
		sql.insert("qna.insert", vo);
	}

	@Override
	public List<QnaVO> qna_list() {
		return sql.selectList("qna.list");
	}

	@Override
	public QnaVO qna_detail(int id) {
		return sql.selectOne("qna.detail", id);
	}

	@Override
	public void qna_update(QnaVO vo) {
		sql.update("qna.update", vo);
	}

	@Override
	public void qna_delete(int id) {
		sql.delete("qna.delete", id);
	}

	@Override
	public void qna_read(int id) {
		sql.update("qna.read", id);
	}

	@Override
	public void qna_reply_insert(QnaVO vo) {
		sql.insert("qna.reply_insert", vo);
	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		page.setTotalList((Integer) sql.selectOne("qna.totalList", page));
		page.setList(sql.selectList("qna.list", page));
		
		return page;
	}

}