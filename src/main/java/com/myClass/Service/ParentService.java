package com.myClass.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.ParentDao;

@Service
public class ParentService {
	@Autowired
	ParentDao parentDao;
	
	public int setStudentMapper ( int parentId, String studentArr ) {
		return parentDao.setStudnetMapper(parentId, studentArr);
	}
}
