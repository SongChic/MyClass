package com.myClass.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Member;

@Repository("userDAO")
public class UserDao {
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
			
			return member;
		}
	};
	
	public Member login (String memId) {
		String sql = getQuery.get("userDao.get");
		
		Object[] params = {
				memId
		};
		
		try {
			System.out.println("pass");
			return jdbcTemplate.queryForObject(sql, getRowMapper, params);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
}
