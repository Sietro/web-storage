package com.inc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inc.domain.Storage;
import com.inc.domain.User;
import com.inc.service.StorageService;

@Controller
public class StorageController {
	
	@Autowired
	private StorageService storageService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String storageGet(@AuthenticationPrincipal User user, Model model) {
		model.addAttribute("storage", new Storage());
		model.addAttribute("storageList", storageService.getList(user.getId()));
		return "/storage/storage";
	}
	
	/*@RequestMapping(value="/storage/sub", method=RequestMethod.GET)
	public String moveSubDir(@AuthenticationPrincipal User user, @RequestParam String fs_uid, Model model) {
		model.addAttribute("storageList",storageService.moveSubDir(user.getId(), fs_uid));
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/parent", method=RequestMethod.GET)
	public String moveParentDir(@AuthenticationPrincipal User user, @RequestParam String fs_pid, Model model) {
		String parent_fs_pid = storageService.moveParentDir(user.getId(), fs_pid).getFs_pid();
		if(parent_fs_pid == null) {
			model.addAttribute("storageList",storageService.getList(user.getId()));
		} else {
			model.addAttribute("storageList",storageService.moveSubDir(user.getId(), parent_fs_pid));
		}
		return "/storage/storage";
	}*/
	
	@RequestMapping(value="/storage/sub", method=RequestMethod.POST)
	public String moveSubDirPost(@ModelAttribute Storage storage, Model model) {
		model.addAttribute("storageList", storageService.moveSubDir(storage));
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/parent", method=RequestMethod.POST)
	public String moveParentDirPost(@ModelAttribute Storage storage, Model model) {
		String parent_fs_pid = storageService.getParentDir(storage).getFs_pid();
		if(parent_fs_pid == null) {
			model.addAttribute("storageList",storageService.getList(storage.getUsers_id()));
		} else {
			storage.setFs_pid(parent_fs_pid);
			model.addAttribute("storageList",storageService.moveSubDir(storage));
		}
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/fileupload", method=RequestMethod.POST)
	public String fileUpload(@RequestParam(defaultValue="root") String location) {
		System.out.println("성공");
		System.out.println(location);
		return "/storage/storage";
	}
}
