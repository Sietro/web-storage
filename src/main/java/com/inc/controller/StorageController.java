package com.inc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StorageController {
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String storageGet() {
		return "/storage/storage";
	}
}
