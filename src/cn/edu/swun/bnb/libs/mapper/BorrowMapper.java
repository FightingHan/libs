package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.Borrow;

public class BorrowMapper implements RowMapper<Borrow> {

	@Override
	public Borrow mapRow(ResultSet rs, int index) throws SQLException {
		Borrow bor = new Borrow();
		bor.setId(rs.getInt("borrow_id"));
		bor.setStudId(rs.getString("stud_id"));
		bor.setISBN(rs.getString("isbn"));
		bor.setBorrowDay(rs.getDate("borrow_day"));
		bor.setShouldReturn(rs.getDate("should_return"));
		bor.setActualReturn(rs.getDate("actual_return"));
		bor.setRenew(rs.getBoolean("renew"));
		bor.setFine(rs.getFloat("fine"));
		return bor;
	}

}
