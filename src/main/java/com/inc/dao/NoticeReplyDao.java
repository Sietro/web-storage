package com.inc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inc.domain.Reply;

@Repository
public class NoticeReplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insertReply(Reply reply) {
		sqlSession.insert("notice_reply.insertReply", reply);
	}

	public Reply selectOneFromReply(int ref) {
		return sqlSession.selectOne("notice_reply.selectOneFromReply", ref);
	}
	
	public int selectBrotherStep(Reply parentReply) {
		return sqlSession.selectOne("notice_reply.brotherStep", parentReply);
	}
	
	public void pushReply(Reply reply) {
		sqlSession.update("notice_reply.pushReply",reply);
	}
	
	public int selectMaxStep(int board_id) {
		return sqlSession.selectOne("notice_reply.maxStep", board_id);
	}

	public void insertRereply(Reply reply) {
		sqlSession.insert("notice_reply.insertRereply", reply);
	}
}






