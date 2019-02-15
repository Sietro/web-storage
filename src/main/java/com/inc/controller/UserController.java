package com.inc.controller;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inc.domain.User;
import com.inc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value= {"/user/signin","/"}, method=RequestMethod.GET)
	public String signinGet(@RequestParam(value = "fail", required = false) String fail,
							@RequestParam(value = "signout", required = false) String signout, 
							Model model) {
		model.addAttribute("user", new User());
		if (fail != null) {
			model.addAttribute("fail", "아이디 또는 비밀번호가 올바르지 않습니다.");
		}
		if (signout != null) {
			model.addAttribute("signout", "로그아웃 되었습니다.");
		}
		return "/user/signin";
	}
	
	@RequestMapping(value="/user/signup", method=RequestMethod.GET)
	public String signupGet(Model model) {
		model.addAttribute("user", new User());
		return "/user/signup";
	}
	
	@RequestMapping(value="/user/signup", method=RequestMethod.POST)
	public String signupPost(@ModelAttribute @Valid User user, 
							BindingResult bindingResult,
							@RequestParam String certifyCode) {
		if(userService.selectOne(user.getId()) != null) {
			bindingResult.addError(new FieldError("idExist", "id", user.getId(),
					false, null, null, "존재하는 아이디 입니다."));
		}else if(!user.getPassword().equals(user.getPasswordchk())) {
			bindingResult.addError(new FieldError("passwordNotEqual", "passwordchk", user.getPasswordchk(),
					false, null, null, "패스워드가 일치 하지 않습니다."));
		}else if(!certifyCode.equals(session.getAttribute("emailCode"))) {
			bindingResult.addError(new FieldError("emailCodeNotEqual", "email", certifyCode,
					false, null, null, "인증코드가 일치 하지 않습니다."));
		}
		if(bindingResult.hasErrors()) {
			return "/user/signup";
		}
		userService.signup(user);
		return "redirect:/";
	}
	
	@RequestMapping(value="/user/dualcheck", method=RequestMethod.POST)
	@ResponseBody
	public String dualCheck(@RequestParam String id) {
		if("".equals(id)) {
			return "null";
		}
		if(userService.selectOne(id) != null) {
			return "exist";
		}
		return "notexist";
	}
	
	@RequestMapping(value="/user/emailcertify", method=RequestMethod.POST)
	@ResponseBody
	public String emailCertify(@RequestParam String email) {
		if("".equals(email)) {
			return "null";
		}
		if(userService.selectOneByEmail(email) != null) {
			return "duplicated";
		}
		String emailCode;
		try {
			emailCode = userService.sendCertifyEmail(email);
		} catch (MessagingException e) {
			return "error";
		}
		System.out.println(emailCode);
		session.setAttribute("email", email);
		session.setAttribute("emailCode", emailCode);
		return "success";
	}
	
	@RequestMapping(value="/user/finduser", method=RequestMethod.GET)
	public String finduserGet(Model model) {
		model.addAttribute("user",new User());
		return "/user/finduser";
	}
	
	@RequestMapping(value="/user/finduser/id", method=RequestMethod.POST)
	@ResponseBody
	public String finduserId(@RequestParam String name,
							 @RequestParam String phone,
							 @RequestParam String email) {
		User existUser = userService.finduserId(name, phone, email); 
		if(existUser == null) {
			return "fail";
		}
		try {
			userService.sendIdEmail(name, email, existUser.getId());
		} catch (MessagingException e) {
			return "error";
		}
		return "success";
	}
	
	@RequestMapping(value="/user/finduser/password", method=RequestMethod.POST)
	@ResponseBody
	public String finduserPassword(@RequestParam String id,
								   @RequestParam String phone,
								   @RequestParam String email) {
		User existUser = userService.finduserPassword(id, phone, email); 
		if(existUser == null) {
			return "fail";
		}
		try {
			userService.sendPasswordEmail(id, email);
		} catch (MessagingException e) {
			return "error";
		}
		return "success";
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String myPage(@AuthenticationPrincipal User user, Model model, HttpServletRequest request) {
		model.addAttribute("user", user);
		String phone = user.getPhone();
		String phone2 = phone.substring(phone.length()-4, phone.length());
		String phone3 = phone.substring(3, phone.length()-4);
		model.addAttribute("phone2", phone2);
		model.addAttribute("phone3", phone3);
		return "/user/mypage";
	}
	
	@RequestMapping(value="/mypage/update", method=RequestMethod.POST)
	public String updateUser(@AuthenticationPrincipal User user,
							 @ModelAttribute @Valid User newUser,
							 BindingResult bindingResult,
							 Model model) {
		if(!userService.passwordChk(user, newUser)) {
			bindingResult.addError(new FieldError("passwordNE", "password", null,
					false, null, null, "패스워드가 틀렸습니다."));
			return "/user/mypage";
		}
		Boolean newPasswordError =bindingResult.hasFieldErrors("newPassword");
		Boolean phoneError =bindingResult.hasFieldErrors("phone");
		Boolean emailError =bindingResult.hasFieldErrors("email");
		if(newPasswordError || phoneError || emailError) {
			String phone = newUser.getPhone();
			String phone2 = phone.substring(phone.length()-4, phone.length());
			String phone3 = phone.substring(3, phone.length()-4);
			model.addAttribute("phone2", phone2);
			model.addAttribute("phone3", phone3);
			return "/user/mypage";
		}
		userService.updateUser(user, newUser);
		System.out.println("암호 : "+user.getPassword());
		return "/user/mypage";
	}
}
