package com.myClass.Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Classes;
import com.mysql.jdbc.Statement;

@Repository("classesDao")
public class ClassesDao {
	@Autowired
	GetQuery getQuery;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<Classes> getRowMapper = new RowMapper<Classes>() {
		
		@Override
		public Classes mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			
			Classes classes = new Classes();
			return classes;
		}
	};
	
	public int setClasses (final Classes classes, int teacherId) {
		
		if ( classes.getId() > 0 ) {
			//update
		} else {
			//insert
			KeyHolder holder = new GeneratedKeyHolder();
			int mapperId = 0;
			
			try {
				jdbcTemplate.update(new PreparedStatementCreator() {
					String sql = getQuery.get("classesDao.setClasses");
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						// TODO Auto-generated method stub
						PreparedStatement pstm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						
						pstm.setString(1, classes.getName());
						pstm.setDate(2, new Date(classes.getStartDate()));
						pstm.setDate(3, new Date(classes.getEndDate()));
						pstm.setDate(4, new Date(classes.getStartTime()));
						pstm.setDate(5, new Date(classes.getEndTime()));
						pstm.setInt(6, classes.getTarget());
						pstm.setString(7, classes.getSubject());
						pstm.setString(8, classes.getSummary());
						pstm.setInt(9, classes.getDays());
						pstm.setInt(10, classes.getClassesViewType());
						pstm.setInt(11, classes.getColor());
						
						
						//현재 사진기능은 구현 안됨
						pstm.setString(12, classes.getPicture());
						pstm.setString(13, classes.getThumbnail());
						
						pstm.setInt(14, classes.getFinished());
						pstm.setInt(15, classes.getMaxNum());
						return pstm;
					}
				},holder);
				
				String sql = getQuery.get("classesDao.setClassesMapper");
				mapperId = holder.getKey().intValue();
				
				Object[] params = {
						mapperId,
						teacherId
				};
				
				return jdbcTemplate.update(sql,params);
			} catch ( DataAccessException e ) {
				e.printStackTrace();
			}
			
		}
		
		return 0;
	}
	
	public List<Map<String, Object>> get ( int id ) {
		String sql = getQuery.get("classesDao.get");
		
		Object[] params = {
			id,
			id
		};
		
		try {
			return jdbcTemplate.queryForList(sql, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		
		return new ArrayList<Map<String,Object>>();
	}
	
}
