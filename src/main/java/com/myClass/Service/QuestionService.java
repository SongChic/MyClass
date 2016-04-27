package com.myClass.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myClass.Dao.QuestionDao;
import com.myClass.Model.Question;
import com.myClass.Model.TestPaper;

@Service( "questionService" )
public class QuestionService {
	@Autowired
	QuestionDao questionDao;
	
	public int setTestPaper ( TestPaper testPaper ) {
		return questionDao.setTestPaper( testPaper );
	}
	
	public int setQuestion ( int id, Question question ) {
		return questionDao.setQuestion(id, question);
	}
}
