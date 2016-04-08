package com.myClass.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;

import com.myClass.Dao.UserDao;
import com.myClass.Model.Member;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public int idCheck (String memId) {
		return userDao.idCheck(memId);
	}
	
	public int pwCheck (String memId, String memPw) {
		return userDao.pwCheck(memId, memPw);
	}
	
	public Member get (String memId) {
		return userDao.get(memId);
	}
	
	public int setSetting (int id, int mainColor) {
		return userDao.setSetting(id, mainColor);
	}

}
