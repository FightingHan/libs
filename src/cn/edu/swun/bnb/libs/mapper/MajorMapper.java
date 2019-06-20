package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.Major;

public class MajorMapper implements RowMapper<Major>{
	@Override	
	public Major mapRow(ResultSet rs, int rowIndex) throws SQLException {
		Major major = new Major();
		major.setInsId(rs.getLong("ins_id"));
		major.setMajorId(rs.getLong("major_id"));
		major.setMajorName(rs.getString("major_name"));
		return major;
	}
}
