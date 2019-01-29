package com.inc.domain;

import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails {
	@Pattern(regexp="[A-Za-z0-9]{5,20}", message="알파벳 대소문자 및 숫자, 5~20 글자 이내")
	private String id;
	
	@Pattern(regexp="(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[A-Za-z0-9!@#$]{5,20}",
			message="알파벳, 숫자, 특수문자(!@#$)을 1글자 이상 포함하는, 5~20 글자 이내")
	private String password;
	private String passwordchk;
	
	@Pattern(regexp="[가-힣]{2,10}", message="한글, 2~10글자")
	private String name;
	
	@NotNull(message="성별을 선택해 주세요.")
	@Pattern(regexp="[fm]", message="잘못된 선택")
	private String gender;
	
	@Pattern(regexp="01[016][0-9]{3,4}[0-9]{4}", message="잘못된 전화번호 형식")
	private String phone;
		
	@Pattern(regexp="[A-Za-z0-9]{3,15}@[A-Za-z0-9.]{3,10}", message="알파벳 대소문자 및 숫자")
	private String email;
	
	@Pattern(regexp="[\\d]{1,10}", message="우편번호를 입력해주세요.")
	private String postcode;
	
	@Pattern(regexp="[A-Za-z0-9가-힣()\\s]{1,50}", message="주소를 입력해주세요.")
	private String address;
	
	private List<Authority> authorities;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordchk() {
		return passwordchk;
	}
	public void setPasswordchk(String passwordchk) {
		this.passwordchk = passwordchk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authorities;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return id;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
}
