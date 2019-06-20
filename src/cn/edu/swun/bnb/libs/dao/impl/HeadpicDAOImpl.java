package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.HeadpicDAO;
import cn.edu.swun.bnb.libs.mapper.HeadPicMapper;
import cn.edu.swun.bnb.libs.pojo.HeadPic;

public class HeadpicDAOImpl implements HeadpicDAO {
	JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<HeadPic> list(){
		String sql = "select * from head_pic";
		List<HeadPic> headpiclist = jdbcTemplate.query(sql, new HeadPicMapper());
		return headpiclist;
	}

}
