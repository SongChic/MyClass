package com.myClass.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
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
			classes.setId(rs.getInt("id"));
			classes.setName(rs.getString("name"));
			classes.setStartDate(rs.getTimestamp("start_date").getTime());
			classes.setEndDate(rs.getTimestamp("end_date").getTime());
			classes.setTarget(rs.getInt("target"));
			classes.setSubject(rs.getString("subject"));
			classes.setSummary(rs.getString("summary"));
			classes.setDays(rs.getInt("days"));
			classes.setClassesViewType(rs.getInt("classes_view_type"));
			classes.setColor(rs.getInt("color"));
			
			classes.setPicture(rs.getString("picture"));
			classes.setThumbnail(rs.getString("thumbnail"));
			
			return classes;
		}
	};
	
	public int setClasses (final Classes classes, int teacherId) {
		
		if ( classes.getId() > 0 ) {
			//update
			
			String sql = getQuery.get("classesDao.edit");
			Object[] params = {
				classes.getName(),
				new Date(classes.getStartDate()),
				new Date(classes.getEndDate()),
				classes.getTarget(),
				classes.getSubject(),
				classes.getSummary(),
				classes.getDays(),
				classes.getClassesViewType(),
				classes.getColor(),
				classes.getPicture(),
				classes.getThumbnail(),
				classes.getFinished(),
				classes.getMaxNum(),
				classes.getId()
			};
			
			try {
				return jdbcTemplate.update(sql, params);
			} catch ( DataAccessException e ) {
				e.printStackTrace();
			}
			
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
						pstm.setTimestamp(2, new Timestamp(classes.getStartDate()));
						pstm.setTimestamp(3, new Timestamp(classes.getEndDate()));
						pstm.setInt(4, classes.getTarget());
						pstm.setString(5, classes.getSubject());
						pstm.setString(6, classes.getSummary());
						pstm.setInt(7, classes.getDays());
						pstm.setInt(8, classes.getClassesViewType());
						pstm.setInt(9, classes.getColor());
						
						//현재 사진기능은 구현 안됨
						pstm.setString(10, classes.getPicture());
						pstm.setString(11, classes.getThumbnail());
						
						pstm.setInt(12, classes.getFinished());
						pstm.setInt(13, classes.getMaxNum());
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
	
	public List<Map<String, Object>> getList ( int id ) {
		
		try {
			String sql = getQuery.get("classesDao.finished");
			jdbcTemplate.update(sql);
			
			sql = getQuery.get("classesDao.getList");
			
			Object[] params = {
				id
			};
			return jdbcTemplate.queryForList(sql, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		
		return new ArrayList<Map<String,Object>>();
	}
	
	public Classes get ( int id ) {
		
		String sql = getQuery.get("classesDao.get");
		
		Object[] params = {
			id	
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, params, getRowMapper);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
