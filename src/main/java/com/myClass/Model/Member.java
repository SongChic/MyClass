package com.myClass.Model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class Member implements UserDetails {
	private int id;
	private String memId;
	private String memPw;
	private String name;
	private String firstEmail;
	private String secondEmail;
	private int firstPhone;
	private int secondPhone;
	private int lastPhone;
	private int userType;
	private int gender;
	private int subject;
	private int city;
	private int district;
	private int birthdayYear;
	private int birthdayMonth;
	private int birthdayDay;
	private String slogan;
	private int mainColor;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMainColor() {
		return mainColor;
	}
	public void setMainColor(int mainColor) {
		this.mainColor = mainColor;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getFirstEmail() {
		return firstEmail;
	}
	public void setFirstEmail(String firstEmail) {
		this.firstEmail = firstEmail;
	}
	public String getSecondEmail() {
		return secondEmail;
	}
	public void setSecondEmail(String secondEmail) {
		this.secondEmail = secondEmail;
	}
	public int getFirstPhone() {
		return firstPhone;
	}
	public void setFirstPhone(int firstPhone) {
		this.firstPhone = firstPhone;
	}
	public int getSecondPhone() {
		return secondPhone;
	}
	public void setSecondPhone(int secondPhone) {
		this.secondPhone = secondPhone;
	}
	public int getLastPhone() {
		return lastPhone;
	}
	public void setLastPhone(int lastPhone) {
		this.lastPhone = lastPhone;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getSubject() {
		return subject;
	}
	public void setSubject(int subject) {
		this.subject = subject;
	}
	public int getCity() {
		return city;
	}
	public void setCity(int city) {
		this.city = city;
	}
	public int getDistrict() {
		return district;
	}
	public void setDistrict(int district) {
		this.district = district;
	}
	public int getBirthdayYear() {
		return birthdayYear;
	}
	public void setBirthdayYear(int birthdayYear) {
		this.birthdayYear = birthdayYear;
	}
	public int getBirthdayMonth() {
		return birthdayMonth;
	}
	public void setBirthdayMonth(int birthdayMonth) {
		this.birthdayMonth = birthdayMonth;
	}
	public int getBirthdayDay() {
		return birthdayDay;
	}
	public void setBirthdayDay(int birthdayDay) {
		this.birthdayDay = birthdayDay;
	}
	public String getSlogan() {
		return slogan;
	}
	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}
	
	public Member (String memId, String memPw) {
		this.memId = memId;
		this.memPw = memPw;
	}
	
	public Member () {
		
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		System.out.println("MODEL Attack");
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		return authorities;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return memPw;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return memId;
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
