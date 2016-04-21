package com.myClass.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Member;

@Repository("TeacherDao")
public class TeacherDao {
	@Autowired
	GetQuery getQuery;
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	RowMapper<Member> getRowMapper = new RowMapper<Member>() {
		@Override
		public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
			// TODO Auto-generated method stub
			Member member = new Member();
			member.setId(rs.getInt("id"));
			member.setMemId(rs.getString("mem_id"));
			member.setMemPw(rs.getString("mem_pw"));
			member.setName(rs.getString("name"));
			member.setEmail(rs.getString("email"));
			member.setPhone(rs.getString("phone"));
			member.setUserType(rs.getInt("user_type"));
			member.setMainColor(rs.getInt("main_color"));
			member.setGender(rs.getInt("gender"));
			member.setProfile(rs.getString("profile"));
			member.setSchool(rs.getString("school"));
			if ( rs.getTimestamp("created") != null ) {
				member.setCreated(rs.getTimestamp("created").getTime());
			}
			member.setBirthdayYear(rs.getInt("birthday_year"));
			member.setBirthdayMonth(rs.getInt("birthday_month"));
			member.setBirthdayDay(rs.getString("birthday_day"));
			
			return member;
		}
	};
	
	public int getTeacherId (int classId) {
		String sql = getQuery.get("teacherDao.getTeacherId");
		
		Object[] params = {
			classId	
		};
		
		try { 
			return jdbcTemplate.queryForInt(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public List<Map<String, Object>> findStudent () {
		String sql = getQuery.get("teacherDao.findStudent");
		
		try {
			return jdbcTemplate.queryForList(sql);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return new ArrayList<Map<String,Object>>();
	}
	
	public List<Map<String, Object>> myStudentList (int teacherId) {
		String sql = getQuery.get("teacherDao.myStudentList");
		Object[] params = {
			teacherId
		};
		
		try {
			return jdbcTemplate.queryForList(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return new ArrayList<Map<String,Object>>();
	}
	
	public int addClassStudent (String classIds, int teacherId, int studentId) {
		String sql = getQuery.get("teacherDao.addClassStudent");
		Object[] params = {
			teacherId,
			studentId,
			classIds
		};
		
		try { 
			return jdbcTemplate.update(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
