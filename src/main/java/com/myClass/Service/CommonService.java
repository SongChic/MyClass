package com.myClass.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.CommonDao;
import com.myClass.Model.Member;

@Service("commonService")
public class CommonService {
	@Autowired
	CommonDao commonDao;
	
	public int studentStateUpdate ( int teacherId, int studentId, int state, int studentState ) {
		return commonDao.studentStateUpdate(teacherId, studentId, state, studentState);
	}
	public Member getClassTeacher ( int classId ) {
		return commonDao.getClassTeacher(classId);
	}
}
