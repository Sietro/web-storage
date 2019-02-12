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

	public List<Storage> getList(Storage storage) {
		File file = new File(filePath+storage.getUsers_id());
        if(file.exists() == false){
            file.mkdirs();
        }
		return storageDao.getList(storage);
	}

	public List<Storage> moveSubDir(Storage storage) {
		List<Storage> storageList = storageDao.moveSubDir(storage);
		if(storageList.size() == 0) {
			storage.setFs_pid(storage.getFs_uid());
			storage.setType(null);
			storageList.add(0, storage);
		}
		return storageList;
	}

	public Storage getParentDir(Storage storage) {
		return storageDao.getParentDir(storage);
	}

	public String fileUpload(HttpServletRequest request, User user, String location) {
		System.out.println("업로드 위치 : " + location);
		multiPartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multiPartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
	    /*String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;*/
        String realLocation = user.getId()+"\\"+location+"\\";
        File file = new File(filePath+realLocation);
        if(file.exists() == false){
            file.mkdirs();
        }
        Storage storage = new Storage();
	    while(iterator.hasNext()){
	        multipartFile = multiPartHttpServletRequest.getFile(iterator.next());
	        storage.setUsers_id(user.getId());
			storage.setFs_uid(getRandomString());
	        storage.setFs_pid(location);
			storage.setName(multipartFile.getOriginalFilename());
			if(storageDao.fsDupCheck(storage) != null) {
				return "isDuplicated";
			}
	        if(multipartFile.isEmpty() == false){
	        	/*originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = getRandomString() + originalFileExtension;
                System.out.println("------------- file start -------------");
                System.out.println("name : "+multipartFile.getName());
                System.out.println("filename : "+multipartFile.getOriginalFilename());
                System.out.println("size : "+multipartFile.getSize());
                System.out.println("originalFileName : "+originalFileName);
                System.out.println("originalFileExtension : "+originalFileExtension);
                System.out.println("storedFileName : "+storedFileName);
                System.out.println("-------------- file end --------------\n");*/
                file = new File(filePath + realLocation + multipartFile.getOriginalFilename());
                storageDao.saveFile(storage);
                System.out.println("경로"+ filePath + realLocation + multipartFile.getOriginalFilename());
                try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	        }
	    }
	    return null;
	}
	
	private String getRandomString(){
		String randomString;
		while(true) {
			randomString = UUID.randomUUID().toString().replaceAll("-", "");
			if(storageDao.uidDupCheck(randomString) == null) {
				break;
			}
		}
        return randomString;
    }

	public String makeDir(String location, String dirName, User user) {
		Storage storage = new Storage();
		storage.setUsers_id(user.getId());
		storage.setFs_uid(getRandomString());
		storage.setFs_pid(location);
		storage.setName(dirName);
		if(storageDao.fsDupCheck(storage) != null) {
			return "isDuplicated";
		}
		storageDao.makeDir(storage);
		File file = new File(filePath+user.getId()+"\\"+location);
		file.mkdirs();
		return null;
	}

}
