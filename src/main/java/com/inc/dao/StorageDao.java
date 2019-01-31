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

	public List<Storage> moveSubDir(Storage storage) {
		return sqlSession.selectList("storage.moveSubDir", storage);
	}

	public Storage moveParentDir(Storage storage) {
		return sqlSession.selectOne("storage.moveParentDir", storage);
	}
	
}
