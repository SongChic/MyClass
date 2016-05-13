package com.myClass.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.TestPaperDao;
import com.myClass.Model.TestPaper;

@Service
public class TestPaperService {
	@Autowired
	TestPaperDao testPaperDao;
	
	public List<Map<String, Object>> viewTestPaper ( int teacherId ) {
		return testPaperDao.viewTestPaper(teacherId);
	}
	public List<Map<String, Object>> viewQuestion ( int id ) {
		return testPaperDao.viewQuestion(id);
	}
	public TestPaper getTestPeper ( int id ) {
		return testPaperDao.getTestPeper(id);
	}
}
