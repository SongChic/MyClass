package com.myClass.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.TeacherDao;
import com.myClass.Model.Member;

@Service
public class TeacherService {
	@Autowired
	TeacherDao teacherDao;
	
	public List<Map<String, Object>> findStudent () {
		return teacherDao.findStudent();
	}
	public int getTeacherId (int classId) {
		return teacherDao.getTeacherId(classId);
	}
	
	public List<Map<String, Object>> myStudentList (int teacherId) {
		return teacherDao.myStudentList(teacherId);
	}
	
	public int addClassStudent (String classIds, int teacherId, int studentId) {
		return teacherDao.addClassStudent(classIds, teacherId, studentId);
	}
	
}
