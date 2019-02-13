package com.inc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String storageGet(@AuthenticationPrincipal User user, Model model) {
		String location = (String)session.getAttribute("location");
		Storage storage = new Storage();
		storage.setUsers_id(user.getId());
		if(location == null) {
			storage.setFs_pid("root");
		}else {
			storage.setFs_pid(location);
		}
		session.setAttribute("location", location);
		model.addAttribute("storage", new Storage());
		model.addAttribute("storageList", storageService.getList(storage));
		//session.removeAttribute("location");
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/sub", method=RequestMethod.POST)
	public String moveSubDirPost(@ModelAttribute Storage storage, Model model) {
		session.setAttribute("location", storage.getFs_uid());
		model.addAttribute("storageList", storageService.moveSubDir(storage));
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/parent", method=RequestMethod.POST)
	public String moveParentDirPost(@ModelAttribute Storage storage, Model model) {
		String parent_fs_pid = storageService.getParentDir(storage).getFs_pid();
		if(parent_fs_pid == null) {
			storage.setFs_pid("root");
			model.addAttribute("storageList",storageService.getList(storage));
		} else {
			storage.setFs_uid(parent_fs_pid);
			model.addAttribute("storageList",storageService.moveSubDir(storage));
		}
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/file/upload", method=RequestMethod.POST)
	public String fileUpload(@RequestParam(defaultValue="root") String location, 
							 HttpServletRequest request,
							 @AuthenticationPrincipal User user,
							 Model model) {
		model.addAttribute("upload", storageService.fileUpload(request, user, location));
		session.setAttribute("location", location);
		return "redirect:/main";
	}
	
	@RequestMapping(value="/storage/mkdir", method=RequestMethod.POST)
	public String makeDir(@RequestParam(defaultValue="root") String location,
						  @RequestParam(defaultValue="새폴더") String dirName,
						  @AuthenticationPrincipal User user,
						  Model model) {
		model.addAttribute("mkdir",storageService.makeDir(location, dirName, user));
		session.setAttribute("location", location);
		return "redirect:/main";
	}
	
	@RequestMapping(value="/storage/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> delete(@RequestParam(defaultValue="root") String fs_uid,
						 @RequestParam(defaultValue="root") String location,
						 @RequestParam String users_id,
						 @RequestParam String name) {
		session.setAttribute("location", location);
		storageService.delete(fs_uid, location, users_id, name);
		Map<String, String> map = new HashMap<>();
		map.put("isSuccess", "true");
		map.put("name", name);
		return map;
	}
}
