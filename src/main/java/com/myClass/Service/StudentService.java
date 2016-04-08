package com.myClass.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.StudentDao;
import com.myClass.Model.Member;

@Service
public class StudentService {
	@Autowired
	StudentDao studentDao;
	
	public List<Member> findStudent(String name) {
		return studentDao.findStudent(name);
	}
}
