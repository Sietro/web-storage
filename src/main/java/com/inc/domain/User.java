package com.inc.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class User {
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
	
	@Pattern(regexp="01[016]\\d{3,4}\\d{4}", message="잘못된 전화번호 형식")
	private String phone;
	@NotNull(message="전화번호를 입력해 주세요.")
	@Pattern(regexp="01[016]", message="잘못된 전화번호 형식")
	private String phone1;
	@Pattern(regexp="\\d{3,4}", message="숫자만 입력해 주세요.")
	private String phone2;
	@Pattern(regexp="\\d{4}", message="숫자만 입력해 주세요.")
	private String phone3;
	
	@Pattern(regexp="[A-Za-z0-9]{3,15}@[A-Za-z.]{3,10}", message="알파벳 대소문자 및 숫자")
	private String email;
	
	@Pattern(regexp="[\\d]{1,10}", message="우편번호를 입력해주세요.")
	private String postcode;
	
	@Pattern(regexp="[A-Za-z0-9가-힣()\\s]{1,30}", message="주소를 입력해주세요.")
	private String address1;
	@Pattern(regexp="[A-Za-z0-9가-힣()\\s]{1,30}", message="주소를 입력해주세요.")
	private String address2;
	private String address;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
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
	
	
}
