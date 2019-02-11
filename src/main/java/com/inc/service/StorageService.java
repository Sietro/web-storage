package com.inc.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.inc.dao.StorageDao;
import com.inc.domain.Storage;
import com.inc.domain.User;

@Service
public class StorageService {
	
	@Autowired
	private StorageDao storageDao;
	
	@Autowired
	private MultipartHttpServletRequest multiPartHttpServletRequest;
	
	private static final String filePath = "C:\\webstorage\\";

	public List<Storage> getList(String users_id) {
		File file = new File(filePath+users_id);
        if(file.exists() == false){
            file.mkdirs();
        }
		return storageDao.getList(users_id);
	}

	public List<Storage> moveSubDir(Storage storage) {
		return storageDao.moveSubDir(storage);
	}

	public Storage getParentDir(Storage storage) {
		return storageDao.getParentDir(storage);
	}

	public void fileUpload(HttpServletRequest request, User user, String location) {
		System.out.println("전송완료");
		multiPartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multiPartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;
        File file = new File(filePath+user.getId());
        if(file.exists() == false){
            file.mkdirs();
        }else {
        	file = new File(filePath+user.getId()+"\\"+location);
        }
	    while(iterator.hasNext()){
	        multipartFile = multiPartHttpServletRequest.getFile(iterator.next());
	        if(multipartFile.isEmpty() == false){
	        	originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = getRandomString() + originalFileExtension;
                file = new File(filePath + storedFileName);
                try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	        }
	    }
	}
	
	private String getRandomString(){
		String randomString;
		while(true) {
			randomString = UUID.randomUUID().toString().replaceAll("-", "");
			if(storageDao.uidDualCheck(randomString) == null) {
				break;
			}
		}
        return randomString;
    }

	public void makeDir(String location, String dirName, User user) {
		Storage storage = new Storage();
		storage.setUsers_id(user.getId());
		storage.setFs_uid(getRandomString());
		storage.setFs_pid(location);
		storage.setName(dirName);
		storageDao.makeDir(storage);
		File file = new File(filePath+user.getId()+"\\"+location);
		file.mkdirs();
	}

}
