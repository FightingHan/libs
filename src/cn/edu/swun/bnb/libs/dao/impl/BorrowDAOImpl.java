package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.BorrowDAO;
import cn.edu.swun.bnb.libs.mapper.BorrowMapper;
import cn.edu.swun.bnb.libs.pojo.Borrow;

public class BorrowDAOImpl implements BorrowDAO {
	
	JdbcTemplate jdbcTemplate;
	
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public List<Borrow> list(){
		String sql = "select * from borrow";
		List<Borrow> borlist = jdbcTemplate.query(sql,new BorrowMapper());
		return borlist;
	}
	public boolean add(Borrow borrow) {
		String sql = "insert into borrow ( values(?,?,?,?,?,?,?)";
		if(jdbcTemplate.update(sql,borrow.getStudId(),borrow.getISBN(),borrow.getBorrowDay(),borrow.getShouldReturn(),borrow.getActualReturn(),borrow.isRenew(),borrow.getFine())==0)
			return false;		
		return true;
	}
}
