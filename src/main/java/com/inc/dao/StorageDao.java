package com.inc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.inc.domain.Storage;

@Repository
public class StorageDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Storage> getList(String users_id) {
		return sqlSession.selectList("storage.getList", users_id);
	}

	public List<Storage> moveDir(Storage storage) {
		return sqlSession.selectList("storage.moveDir", storage);
	}
	
}
