package com.myClass.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myClass.Model.TestPaper;

@Repository("testPaperDao")
public class TestPaperDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	GetQuery getQuery;
	
	RowMapper<TestPaper> getRowMapper = new RowMapper<TestPaper>() {

		@Override
		public TestPaper mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			TestPaper testPaper = new TestPaper();
			testPaper.setId(rs.getInt("id"));
			testPaper.setTitle(rs.getString("title"));
			testPaper.setTeacherId(rs.getInt("teacher_id"));
			testPaper.setTextBook(rs.getString("text_book"));
			testPaper.setSubject(rs.getInt("subject"));
			testPaper.setSchoolLevel(rs.getInt("school_level"));
			testPaper.setSchoolYear(rs.getInt("school_year"));
			
			//제한시간 및 기간 현재 미구현
			return testPaper;
		}
		
	};
	
public List<TestPaper> viewTestPaper ( int teacherId ) {
		
		String sql = getQuery.get("questionDao.viewTestPaper");
		Object[] params = {
			teacherId	
		};
		
		try {
			return jdbcTemplate.query(sql, params, getRowMapper);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return new ArrayList<TestPaper>();
	}
}
