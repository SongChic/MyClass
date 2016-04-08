package com.myClass.Model;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;

public class Role implements GrantedAuthority {
	
	private String name;
	private List<Privilege> privileges;
	
	

	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public List<Privilege> getPrivileges() {
		return privileges;
	}



	public void setPrivileges(List<Privilege> privileges) {
		this.privileges = privileges;
	}



	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return this.name;
	}

}
