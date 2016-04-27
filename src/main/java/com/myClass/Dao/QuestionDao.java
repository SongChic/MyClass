package com.myClass.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		int id = 0;
		
		KeyHolder holder = new GeneratedKeyHolder();
		
		try {
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
					// TODO Auto-generated method stub
					String sql = getQuery.get("questionDao.setTestPaper");
					PreparedStatement pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					pstm.setString(1, testPaper.getTitle());
					pstm.setString(2, testPaper.getCreator());
					return pstm;
				}
			},holder);
			
			return holder.getKey().intValue();
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int setQuestion ( int id, Question question ) {
		String sql = getQuery.get("questionDao.setQuestion");
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
		return 0;
	}
	
}
