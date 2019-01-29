package com.inc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inc.domain.Reply;

@Repository
public class QnaReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insertReply(Reply reply) {
		sqlSession.insert("qna_reply.insertReply", reply);
	}

	public Reply selectOneFromReply(int ref) {
		return sqlSession.selectOne("qna_reply.selectOneFromReply", ref);
	}
	
	public int selectBrotherStep(Reply parentReply) {
		return sqlSession.selectOne("qna_reply.brotherStep", parentReply);
	}
	
	public void pushReply(Reply reply) {
		sqlSession.update("qna_reply.pushReply",reply);
	}
	
	public int selectMaxStep(int board_id) {
		return sqlSession.selectOne("qna_reply.maxStep", board_id);
	}

	public void insertRereply(Reply reply) {
		sqlSession.insert("qna_reply.insertRereply", reply);
	}
}






