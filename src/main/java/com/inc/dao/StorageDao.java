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
	
	public List<Storage> getList(Storage storage) {
		return sqlSession.selectList("storage.getList", storage);
	}

	public List<Storage> moveSubDir(Storage storage) {
		return sqlSession.selectList("storage.moveSubDir", storage);
	}

	public Storage getParentDir(Storage storage) {
		return sqlSession.selectOne("storage.getParentDir", storage);
	}

	public void makeDir(Storage storage) {
		sqlSession.insert("storage.makeDir", storage);
	}
	
	public Storage uidDupCheck(String randomString) {
		return sqlSession.selectOne("storage.uidDualCheck", randomString);
	}

	public Storage fsDupCheck(Storage storage) {
		return sqlSession.selectOne("storage.fsDupCheck", storage);
	}

	public void saveFile(Storage storage) {
		sqlSession.insert("storage.saveFile", storage);
	}

	public void delete(String fs_uid) {
		sqlSession.delete("storage.delete", fs_uid);
	}

	public Storage getParent_name(String location) {
		return sqlSession.selectOne("storage.getParent_name", location);
	}
	
}
