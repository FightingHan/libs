package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.HeadPic;

public class HeadPicMapper implements RowMapper<HeadPic> {
	
	@Override
	public HeadPic mapRow(ResultSet rs, int rowIndex) throws SQLException {
		HeadPic headPic = new HeadPic();
		headPic.setPic_id(rs.getInt("pic_id"));
		headPic.setUrl(rs.getString("url"));
		return headPic;
	}
	

}
