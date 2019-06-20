package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.MajorDAO;
import cn.edu.swun.bnb.libs.mapper.MajorMapper;
import cn.edu.swun.bnb.libs.pojo.Major;

public class MajorDAOImpl implements MajorDAO {
	JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Major> listmajor(){
		String sql = "select * from major";
		List<Major> majorlist = jdbcTemplate.query(sql,new MajorMapper());
		return majorlist;		
	}
	public List<Major> findmajors(Integer insId){
		String sql = "select * from major where ins_id = ?";
		List<Major> majorlist = jdbcTemplate.query(sql,new MajorMapper(),insId.toString());
		return majorlist;
	}

}
