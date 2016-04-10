package com.myClass.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("parentDao")
public class ParentDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	GetQuery getQuery;
	
	public int setStudnetMapper (int parentId, String studentArr) {
		String sql = getQuery.get("parentDao.setStudentMapper");
		
		Object[] params = {
				parentId,
				studentArr
		};
		try {
			return jdbcTemplate.update(sql, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
