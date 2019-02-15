package com.inc.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.inc.dao.UserDao;
import com.inc.domain.User;

@Service
public class UserService implements UserDetailsService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public User selectOne(String id) {
		return userDao.selectOne(id); 
	}

	public User selectOneByEmail(String email) {
		return userDao.selectOneByEmail(email);
	}
	
	public String sendCertifyEmail(String email) throws MessagingException {
		String from = "tncrjaeoddl@gmail.com";
		String subject = "[WebStorage] Certify Email";
		String emailCode = getRandomCode();
		String content = "WebStorage 인증 메일 입니다. 인증 코드는 ["+emailCode+"] 입니다. "
				+ "인증코드를 입력하여 회원가입을 완료해주세요.";
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
		helper.setFrom(from);
		helper.setTo(email);
		helper.setSubject(subject);
		helper.setText(content);
		mailSender.send(msg);
		return emailCode;
	}

	private String getRandomCode() {
		String code = "";
		for(int i = 0; i < 4; i++) {
			code += (int) (Math.random()*9);
		}
		return code;
	}

	public void signup(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		userDao.signup(user);
	}

	public User finduserId(String name, String phone, String email) {
		User user = new User();
		user.setName(name);
		user.setPhone(phone);
		user.setEmail(email);
		return userDao.finduserId(user);
	}
	
	public void sendIdEmail(String name, String email, String id ) throws MessagingException {
		String from = "tncrjaeoddl@gmail.com";
		String subject = "[WebStorage] Certify Email";
		String content = "WebStorage 입니다. ["+name+"] 님의 아이디는 ["+id+"] 입니다.";
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
		helper.setFrom(from);
		helper.setTo(email);
		helper.setSubject(subject);
		helper.setText(content);
		mailSender.send(msg);
	}

	public User finduserPassword(String id, String phone, String email) {
		User user = new User();
		user.setId(id);
		user.setPhone(phone);
		user.setEmail(email);
		return userDao.finduserPassword(user);
	}
	
	public void sendPasswordEmail(String id, String email) throws MessagingException {
		String from = "tncrjaeoddl@gmail.com";
		String subject = "[WebStorage] Certify Email";
		String content = "WebStorage 입니다. ["+id+"] 님의 암호는는 ["+getRandomCode()+"] 입니다."
				+ "로그인 이후 암호를 변경하여 주세요.";
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
		helper.setFrom(from);
		helper.setTo(email);
		helper.setSubject(subject);
		helper.setText(content);
		mailSender.send(msg);
	}

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		User user = userDao.selectOne(id);
		if(user == null) {
			throw new UsernameNotFoundException("아이디 또는 비밀번호가 올바르지 않습니다.");
		}
		return user;
	}
	
	

	public void updateUser(User user, User newUser) {
		Boolean checkPassword = user.getPassword().equals(newUser.getNewPassword());
		Boolean checkPhone = user.getPhone().equals(newUser.getPhone());
		Boolean checkEmail = user.getEmail().equals(newUser.getEmail());
		if(!checkPassword || !checkPhone || !checkEmail) {
			if(!checkPassword) {
				String encodedPassword = passwordEncoder.encode(newUser.getNewPassword());
				user.setPassword(encodedPassword);
				System.out.println("변환완료");
			} else if(!checkPhone){
				user.setPhone(newUser.getPhone());
			} else if(!checkEmail){
				user.setEmail(newUser.getEmail());
			}
		}
		userDao.updateUser(user);
		loadUserByUsername(user.getId());
	}

	public boolean passwordChk(User user, User newUser) {
		return passwordEncoder.matches(newUser.getPassword(), user.getPassword());
	}
}
