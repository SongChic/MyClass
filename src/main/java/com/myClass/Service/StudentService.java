package com.myClass.Service;

import java.util.List;
import java.util.Map;

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
	
	public List<Map<String, Object>> getTeacher (int studentId) {
		return studentDao.getTeacher(studentId);
	}
	
	public List<Map<String, Object>> findTeacher (String name, String studentId) {
		return studentDao.findTeacher(name, studentId);
	}
	
	public int classRequest ( int teacherId, int studentId, String classIds ) {
		return studentDao.classRequest(teacherId, studentId, classIds);
	}
	
	public int requestCancel (int teacherId, int StudentId) {
		return studentDao.requestCancel(teacherId, StudentId);
	}
	
	public List<Map<String, Object>> getTeacherClassName (int teacherId) {
		return studentDao.getTeacherClassName(teacherId);
	}
	public List<Map<String, Object>> getClass ( int id, boolean state ) {
		return studentDao.getClass(id, state);
	}
	public List<Map<String, Object>> getOurClasses ( int studentId ) {
		return studentDao.getOurClasses(studentId);
	}
}
