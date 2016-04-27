package com.myClass.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("commonDao")
public class CommonDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	GetQuery getQuery;
	
	public int studentStateUpdate ( int teacherId, int studentId, int state, int studentState ) {
		String sql = getQuery.get("commonDao.updateStudentState");
		Object[] params = {
			state,
			studentState,
			teacherId,
			studentId
		};
		
		try {
			return jdbcTemplate.update(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
