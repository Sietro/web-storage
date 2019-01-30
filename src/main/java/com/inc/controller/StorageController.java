package com.inc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.inc.domain.User;
import com.inc.service.StorageService;

@Controller
public class StorageController {
	
	@Autowired
	private StorageService storageService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String storageGet(@AuthenticationPrincipal User user, Model model) {
		model.addAttribute("storageList",storageService.getList(user.getId()));
		return "/storage/storage";
	}
	
	@RequestMapping(value="/storage/dir", method=RequestMethod.GET)
	public String moveDir(@AuthenticationPrincipal User user, @RequestParam String uid, Model model) {
		model.addAttribute("storageList",storageService.moveDir(user.getId(), uid));
		return "/storage/storage";
	}
}
