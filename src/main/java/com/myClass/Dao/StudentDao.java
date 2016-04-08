package com.myClass.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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
			member.setUserType(rs.getInt("user_type"));
			member.setMainColor(rs.getInt("main_color"));
			
			member.setSchool(rs.getString("school"));
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
	
}
