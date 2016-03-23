package com.myClass.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.TeacherDao;
import com.myClass.Dao.UserDao;
import com.myClass.Model.Member;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public Member login (String memId) {
		System.out.println("Service : " + memId);
		return userDao.login(memId);
	}
}
