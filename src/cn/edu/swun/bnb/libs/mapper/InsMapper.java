package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.Ins;

public class InsMapper implements RowMapper<Ins> {
	
	@Override	
	public Ins mapRow(ResultSet rs, int rowIndex) throws SQLException {
		Ins ins = new Ins();
		ins.setInsId(rs.getLong("ins_id"));
		ins.setInsName(rs.getString("ins_name"));
		return ins;
	}

}
