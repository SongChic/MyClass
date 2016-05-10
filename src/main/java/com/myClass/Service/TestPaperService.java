package com.myClass.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.TestPaperDao;
import com.myClass.Model.TestPaper;

@Service
public class TestPaperService {
	@Autowired
	TestPaperDao testPaperDao;
	
	public List<TestPaper> viewTestPaper ( int teacherId ) {
		return testPaperDao.viewTestPaper(teacherId);
	}
}
