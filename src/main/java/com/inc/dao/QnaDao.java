package com.inc.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inc.domain.Board;

@Repository
public class QnaDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Board> selectListFromBoard(Map<String, Object> map){
		return sqlSession.selectList("qna_board.selectListFromBoard", map);
	}

	public int getTotalCount() {
		return sqlSession.selectOne("qna_board.totalCount");
	}

	public void insertBoard(Board board) {
		sqlSession.insert("qna_board.insertBoard", board);
	}

	public Board selectOneFromBoard(int id) {
		return sqlSession.selectOne("qna_board.selectOneFromBoard", id);
	}

	public void hitUp(int id) {
		sqlSession.update("qna_board.hitUp", id);
	}

	public void deleteBoard(int id) {
		sqlSession.delete("qna_board.deleteBoard", id);
	}

	public void updateBoard(Board board) {
		sqlSession.update("qna_board.updateBoard", board);
	}
	
}





