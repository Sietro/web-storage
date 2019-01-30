package com.inc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.dao.StorageDao;
import com.inc.domain.Storage;

@Service
public class StorageService {
	
	@Autowired
	private StorageDao storageDao;

	public List<Storage> getList(String users_id) {
		return storageDao.getList(users_id);
	}

	public List<Storage> moveDir(String id, String uid) {
		Storage storage = new Storage();
		storage.setUsers_id(id);
		storage.setUid(uid);
		return storageDao.moveDir(storage);
	}
}
