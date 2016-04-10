package com.myClass.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.ClassesDao;
import com.myClass.Model.Classes;

@Service
public class ClassesService {
	@Autowired
	ClassesDao classesDao;
	
	public int setClasses(Classes classes, int teacherId) {
		return classesDao.setClasses(classes, teacherId);
	}
	
	public List<Map<String, Object>> get (int id) {
		return classesDao.get(id);
	}
}
