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

@Repository("studentDao")
public class StudentDao {
	
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
	
	public List<Member> findStudent (String name) {
		String sql = getQuery.get("studentDao.findStudent") + "'%" + name + "%'" + " and user_type = 3";

		try {
			return jdbcTemplate.query(sql, getRowMapper);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Map<String, Object>> getTeacher (int studentId) {
		String sql = getQuery.get("studentDao.getTeacher");
		Object[] params = {
			studentId	
		};
		
		try {
			return jdbcTemplate.queryForList(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return new ArrayList<Map<String,Object>>();
	}
	
	public List<Map<String, Object>> findTeacher (String name, String studentId) {
		String sql = getQuery.get("studentDao.findTeacher");
		Object[] params = {
			"%" + name + "%",
			studentId
		};
		
		try {
			return jdbcTemplate.queryForList(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		return new ArrayList<Map<String,Object>>();
	}
	
	public int classRequest ( int teacherId, int studentId, String classIds ) {
		String sql = getQuery.get("studentDao.classRequest");
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
	
	public int requestCancel (int teacherId, int StudentId) {
		String sql = getQuery.get("studentDao.requestCancel");
		Object[] params = {
			teacherId,
			StudentId
		};
		
		try {
			return jdbcTemplate.update(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public List<Map<String, Object>> getTeacherClassName (int teacherId) {
		String sql = getQuery.get("studentDao.getTeacherClassName");
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
	
	public List<Map<String, Object>> getClassNames( String classIds ) {
		String sql = getQuery.get("studentDao.getClassNames");
		return new ArrayList<Map<String,Object>>();
	}
	
	public List<Map<String, Object>> getClass ( int id, boolean state ) {
		String sql = getQuery.get("studentDao.getClass");
		Object[] params = {
				id
		};
		
		if ( state ) {
			sql += " and class.finished != 1";
		}
		
		try {
			return jdbcTemplate.queryForList(sql, params);
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		return new ArrayList<Map<String,Object>>();
	}
}
