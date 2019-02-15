package com.inc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inc.domain.User;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public User selectOne(String id) {
		return sqlSession.selectOne("user.selectOne",id);
	}

	public User selectOneByEmail(String email) {
		return sqlSession.selectOne("user.selectOneByEmail",email);
	}

	public void signup(User user) {
		sqlSession.insert("user.signup",user);
	}

	public User finduserId(User user) {
		return sqlSession.selectOne("user.finduserId",user);
	}

	public User finduserPassword(User user) {
		return sqlSession.selectOne("user.finduserPassword",user);
	}

	public void updateUser(User user) {
		sqlSession.update("user.updateUser",user);
	}
	
}
