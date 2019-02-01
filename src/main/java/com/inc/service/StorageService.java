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

	public List<Storage> moveSubDir(Storage storage) {
		return storageDao.moveSubDir(storage);
	}

	public Storage getParentDir(Storage storage) {
		return storageDao.getParentDir(storage);
	}
}
