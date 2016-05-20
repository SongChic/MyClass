package com.myClass.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Question;
import com.myClass.Model.TestPaper;
import com.mysql.jdbc.Statement;

@Repository("questionDao")
public class QuestionDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	GetQuery getQuery;
	
	public int setTestPaper ( final TestPaper testPaper ) {
		int id = testPaper.getId();
		
		KeyHolder holder = new GeneratedKeyHolder();
		
		if ( id > 0 ) {
			String sql = getQuery.get("questionDao.editTestPeper");
			
			Object[] params = {
					testPaper.getTitle(),
					testPaper.getTextBook(),
					testPaper.getSchoolLevel(),
					testPaper.getSchoolYear(),
					id
			};
			
			return jdbcTemplate.update(sql, params);
		} else {
			try {
				jdbcTemplate.update(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						// TODO Auto-generated method stub
						String sql = getQuery.get("questionDao.setTestPaper");
						
						PreparedStatement pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						
						
						pstm.setString(1, testPaper.getTitle());
						pstm.setInt(2, testPaper.getTeacherId());
						pstm.setString(3, testPaper.getTextBook());
						pstm.setInt(4, testPaper.getSubject());
						pstm.setInt(5, testPaper.getSchoolLevel());
						pstm.setInt(6, testPaper.getSchoolYear());
						pstm.setTimestamp(7, new Timestamp(testPaper.getLimit()));
						
						return pstm;
					}
				},holder);
				
				return holder.getKey().intValue();
			} catch ( DataAccessException e ) {
				e.printStackTrace();
			}
		}
		
		
		return 0;
	}
	
	public int setQuestion ( int id, Question question, Boolean edited ) {
		String sql = "";
		
		if ( edited ) {
			
			sql = getQuery.get("questionDao.editQuestion");
			Object[] params = {
					question.getTitle(),
					question.getSelectNum(),
					question.getQuestionNum(),
					question.getQuestion(),
					question.getAnswer(),
					id,
					question.getSelectNum(),
					question.getQuestionNum()
				};
			try {
				return jdbcTemplate.update(sql, params);
			} catch ( DataAccessException e ) {
				e.printStackTrace();
			}

		} else {
			sql = getQuery.get("questionDao.setQuestion");
			Object[] params = {
					id,
					question.getTitle(),
					question.getSelectNum(),
					question.getQuestionNum(),
					question.getQuestion(),
					question.getAnswer(),
					question.getAddQuestion(),
					question.getQuestionImg()
				};
			try {
				return jdbcTemplate.update(sql, params);
			} catch ( DataAccessException e ) {
				e.printStackTrace();
			}

		}
		

		
		
		return 0;
	}
	
}
