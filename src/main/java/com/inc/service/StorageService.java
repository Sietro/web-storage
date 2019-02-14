package com.inc.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
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
	
	private File getRealPath(String location, String id, String name) {
		String path = "\\root\\";
		if(!"root".equals(location)) {
			String realpath = "";
			while(location != null) {
				realpath = storageDao.getParent_name(location).getName() + "\\" + realpath;
				location = storageDao.getParent_name(location).getFs_pid();
			}
			path = path + realpath;
		}
		return new File(filePath+id+path+name);
	}
	
	public String fileUpload(HttpServletRequest request, User user, String location) {
		multiPartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multiPartHttpServletRequest.getFileNames();
	    MultipartFile multipartFile = null;
        File file = getRealPath(location, user.getId(), "");
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
                file = new File(file.getPath()+ "\\" + multipartFile.getOriginalFilename());
                storageDao.saveFile(storage);
                try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
	        }
	    }
	    return null;
	}

	public String makeDir(String location, String dirName, User user) {
		Storage storage = new Storage();
		storage.setUsers_id(user.getId());
		storage.setFs_uid(getRandomString());
		storage.setFs_pid(location);
		storage.setName(dirName);
		if(storageDao.fsDupCheck(storage) != null) {
			if("새폴더".equals(dirName)) {
				int i = 1;
				while(storageDao.fsDupCheck(storage) != null) {
					dirName = "새폴더("+i+")";
					storage.setName(dirName);
					i++;
				}
			}else {
				return "isDuplicated";
			}
		}
		storageDao.makeDir(storage);
		File file = getRealPath(location, user.getId(), dirName);
		if(file.exists() == false){
			file.mkdirs();
        }
		return null;
	}

	public void delete(String fs_uid, String location, String users_id, String name) {
		File file = getRealPath(location, users_id, name);
		if(file.exists()){
			Boolean deleted = false;
			if(file.isDirectory()) {
				deleted = deleteFolder(file);
			}else {				
				deleted = file.delete();
			}
			System.out.println("파일삭제 : " + deleted);
			if(deleted) {
				storageDao.delete(fs_uid);
			}
        }
	}
	
	private boolean deleteFolder(File file) {
		File[] file_list = file.listFiles(); //파일리스트 얻어오기
		
		for (int i = 0; i < file_list.length; i++) {
		    if(file_list[i].isFile()) {
		    	file_list[i].delete();
		    	System.out.println("파일이 삭제되었습니다.");
		    }else {
		    	File subFile = new File(file_list[i].getPath());
		    	deleteFolder(subFile); //재귀함수호출
		    	System.out.println("폴더가 삭제되었습니다.");
		    }
		    file_list[i].delete();
		 }
		 return file.delete(); //폴더 삭제
	 }

	public File fileDownload(Storage storage) {
		if("".equals(storage.getFs_pid())) {
			storage.setFs_pid("root");
		}
		System.out.println("pid : "+storage.getFs_pid());
		return getRealPath(storage.getFs_pid(), storage.getUsers_id(), storage.getName());
	}

	public String fileNameUpdate(String fs_uid, 
								 String users_id, 
								 String name, 
								 String location, 
								 String newName) {
		File sourceFile = getRealPath(location, users_id, name);
		File destinationFile = getRealPath(location, users_id, newName);
		boolean rename = sourceFile.renameTo(destinationFile);
		if(!rename) {
			return "fail";
		}
		Storage storage = new Storage();
		storage.setFs_uid(fs_uid);
		storage.setFs_pid(location);
		storage.setUsers_id(users_id);
		storage.setName(newName);
		storageDao.fileNameUpdate(storage);
		return "success";
	}
}
