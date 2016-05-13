package com.myClass.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Member;

@Repository("commonDao")
public class CommonDao {
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	GetQuery getQuery;
	
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
	
	public Member getClassTeacher ( int classId ) {
		String sql = getQuery.get("studentDao.getClassTeacher");
		Object[] params = {
				classId	
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, getRowMapper, params);
		} catch (DataAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
}
