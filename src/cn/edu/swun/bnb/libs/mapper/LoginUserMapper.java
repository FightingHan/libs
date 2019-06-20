package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.LibUser;

public class LoginUserMapper implements RowMapper<LibUser> {
	
	
	@Override
	public LibUser mapRow(ResultSet rs, int rowIndex) throws SQLException {
		LibUser user = new LibUser();
		user.setRegisterTime(rs.getDate("register_time"));
		user.setId(rs.getString("user_id"));
		user.setPassword(rs.getString("password"));
		user.setMale(rs.getString("male"));
		user.setEmail(rs.getString("email"));
		user.setEnabled(rs.getBoolean("enabled"));
		user.setHeadId(rs.getInt("head_id"));
		user.setNickname(rs.getString("nickname"));
		user.setUserType(rs.getInt("user_type"));
		return user;
	}

}
