package com.myClass.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Schedule;

@Repository("scheduleDao")
public class ScheduleDao {
	@Autowired 
	GetQuery getQuery;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<Schedule> getRowMapper = new RowMapper<Schedule>() {
		
		@Override
		public Schedule mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			Schedule schedule = new Schedule();
			
			schedule.setId(rs.getInt("id"));
			schedule.setTitle(rs.getString("title"));
			schedule.setType(rs.getInt("type"));
			schedule.setContent(rs.getString("content"));
			schedule.setCreator(rs.getString("creator"));
			schedule.setCreated(rs.getTimestamp("created").getTime());
			schedule.setColor(rs.getString("color"));
			schedule.setCreatorId(rs.getInt("creator_id"));
			return schedule;
		}
	};
	
	public List<Schedule> get() {
		String sql = getQuery.get("scheduleDao.get");
		
		Object[] params = {
				
		};
		
		try {
			return jdbcTemplate.query(sql, params, getRowMapper);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int setSchedule (int id, long created) {
		String sql = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Object[] params = {
			sdf.format(new Date(created)),
			id
		};
		
		try {
			if (id > 0) {
				sql = getQuery.get("scheduleDao.edit");
				return jdbcTemplate.update(sql, params);
			} else {
				return jdbcTemplate.update(sql);
			}
			
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
}
