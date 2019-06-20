package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.InsDAO;
import cn.edu.swun.bnb.libs.mapper.InsMapper;
import cn.edu.swun.bnb.libs.pojo.Ins;

public class InsDAOImpl implements InsDAO {
	JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Ins> listins(){
		String sql = "select * from institute";
		List<Ins> inslist = jdbcTemplate.query(sql,new InsMapper());
		return inslist;		
	}

}
