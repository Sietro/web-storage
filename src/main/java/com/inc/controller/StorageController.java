package com.inc.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String storageGet(@AuthenticationPrincipal User user,
							 @RequestParam(required=false) String fromMenu,
							 Model model) {
		String location = null;
		if(fromMenu == null) {
			location = (String)session.getAttribute("location");
		}else {
			session.setAttribute("location", null);
		}
		Storage storage = new Storage();
		storage.setUsers_id(user.getId());
		if("".equals(location) || location == null) {
			storage.setFs_pid("root");
		}else {
			storage.setFs_pid(location);
		}
		model.addAttribute("storage", new Storage());
		model.addAttribute("storageList", storageService.getList(storage));
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
		session.setAttribute("location", parent_fs_pid);
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
	public String fileUpload(@RequestParam String location, 
							 @AuthenticationPrincipal User user,
							 HttpServletRequest request,
							 RedirectAttributes redirectAttributes) {
		if("".equals(location) || location == null) {
			location = "root";
		}
		//model.addAttribute("upload", storageService.fileUpload(request, user, location));
		redirectAttributes.addFlashAttribute("upload", storageService.fileUpload(request, user, location));
		return "redirect:/main";
	}
	
	@RequestMapping(value="/storage/mkdir", method=RequestMethod.POST)
	public String makeDir(@RequestParam String location,
						  @RequestParam(defaultValue="새폴더") String dirName,
						  @AuthenticationPrincipal User user,
						  RedirectAttributes redirectAttributes) {
		session.setAttribute("location", location);
		if("".equals(location) || location == null) {
			location = "root";
		}
		//model.addAttribute("mkdir",storageService.makeDir(location, dirName, user));
		redirectAttributes.addFlashAttribute("mkdir",storageService.makeDir(location, dirName, user));
		return "redirect:/main";
	}
	
	@RequestMapping(value="/storage/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,String> delete(@RequestParam(defaultValue="root") String fs_uid,
									 @RequestParam String location,
									 @RequestParam String users_id,
									 @RequestParam String name) {
		session.setAttribute("location", location);
		if("".equals(location) || location == null) {
			location = "root";
		}
		Storage storage = new Storage();
		storage.setFs_pid(location);
		storage.setUsers_id(users_id);
		storage.setFs_uid(fs_uid);
		storage.setName(name);
		storageService.delete(storage);
		Map<String, String> map = new HashMap<>();
		map.put("isSuccess", "true");
		map.put("name", name);
		if(storageService.checkLocation(storage).size() == 0) {
			if("root".equals(location)) {
				session.setAttribute("location", null);
			}else {
				session.setAttribute("location", storageService.getParentDir(storage).getFs_pid());
			}
		}
		return map;
	}
	
	@RequestMapping(value="/storage/file", method=RequestMethod.POST)
	public void fileDownload(@ModelAttribute Storage storage, HttpServletResponse response) {
		File file = storageService.fileDownload(storage);
		byte fileByte[];
		try {
			fileByte = FileUtils.readFileToByteArray(file);
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(file.getName(),"UTF-8")+"\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.getOutputStream().write(fileByte);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/storage/update", method=RequestMethod.POST)
	@ResponseBody
	public String fileNameUpdate(@RequestParam(defaultValue="root") String fs_uid,
								 @RequestParam String location,
								 @RequestParam String users_id,
								 @RequestParam String name,
								 @RequestParam String newName) {
		if("".equals(location) || location == null) {
			location = "root";
		}
		return storageService.fileNameUpdate(fs_uid, users_id, name, location, newName);
	}
	
}
