package com.myClass.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.myClass.Model.Member;
import com.mysql.jdbc.Statement;

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
	
	public int idCheck (String memId) {
		String sql = getQuery.get("userDao.idCheck");
		
		Object[] params = {
				memId
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, params, Integer.class);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int pwCheck (String memId, String mempw) {
		String sql = getQuery.get("userDao.pwCheck");
		
		Object[] params = {
				memId,
				mempw
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, params, Integer.class);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Member get(String memId) {
		String sql = getQuery.get("userDao.get");
		
		Object[] params = {
			memId
		};
		
		try {
			return jdbcTemplate.queryForObject(sql, params, getRowMapper);
		} catch(DataAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int setSetting (int id, int mainColor) {
		String sql = getQuery.get("userDao.setting");
		Object[] params = {
			mainColor,
			id
		};
		
		try {
			return jdbcTemplate.update(sql, params);
		} catch(DataAccessException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int setMember (final Member member) {
		
		String sql = "";
		
		System.out.println(member.getUserType());
		
		try {
			
			if ( member.getId() > 0 ) {
				
			}
			
			if ( member.getUserType() == 1 ) {
				
				if ( member.getId() > 0 ) {
					sql = getQuery.get("teacherDao.update");
					Object[] params = {
						member.getName(),
						member.getEmail(),
						member.getPhone(),
						member.getGender(),
						member.getBirthdayYear(),
						member.getBirthdayMonth(),
						member.getBirthdayDay(),
						member.getProfile(),
						member.getId()
					};
					
					return jdbcTemplate.update(sql, params);
				}
				
				sql = getQuery.get("teacherDao.setMember");
				Object[] params = {
					member.getMemId(),
					member.getMemPw(),
					member.getName(),
					member.getEmail(),
					member.getPhone(),
					member.getUserType(),
					member.getGender(),
					member.getBirthdayYear(),
					member.getBirthdayMonth(),
					member.getBirthdayDay(),
					member.getSlogan(),
					member.getProfile()
				};
				
				return jdbcTemplate.update(sql, params);
			} else if ( member.getUserType() == 2 ) {
				sql = getQuery.get("parentDao.setMember");
				Object[] params = {
					member.getMemId(),
					member.getMemPw(),
					member.getName(),
					member.getEmail(),
					member.getPhone(),
					member.getUserType(),
					member.getGender(),
					member.getBirthdayYear(),
					member.getBirthdayMonth(),
					member.getBirthdayDay(),
				};
				
				KeyHolder keyHolder = new GeneratedKeyHolder();
				jdbcTemplate.update(new PreparedStatementCreator() {
					String parentSql = getQuery.get("parentDao.setMember");
					
					@Override
					public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
						// TODO Auto-generated method stub
						
						PreparedStatement pstm = con.prepareStatement(parentSql, Statement.RETURN_GENERATED_KEYS);
						pstm.setString (1, member.getMemId() );
						pstm.setString (2, member.getMemPw() );
						pstm.setString (3, member.getName() );
						pstm.setString (4, member.getEmail() );
						pstm.setString (5, member.getPhone() );
						pstm.setInt (6, member.getUserType() );
						pstm.setInt (7, member.getGender() );
						pstm.setInt (8, member.getBirthdayYear() );
						pstm.setInt (9, member.getBirthdayMonth() );
						pstm.setString (10, member.getBirthdayDay() );
						return pstm;
					}
				},keyHolder);
				
				return keyHolder.getKey().intValue();
				
//				return jdbcTemplate.update(sql, params);
			} else if ( member.getUserType() == 3 ) {
				sql = getQuery.get("studentDao.setMember");
				Object[] params = {
					member.getMemId(),
					member.getMemPw(),
					member.getName(),
					member.getEmail(),
					member.getPhone(),
					member.getUserType(),
					member.getGender(),
					member.getBirthdayYear(),
					member.getBirthdayMonth(),
					member.getBirthdayDay(),
					member.getSchool()
				};
				
				return jdbcTemplate.update(sql, params);
			}
			
		} catch ( DataAccessException e ) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
