package cn.edu.swun.bnb.libs.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import cn.edu.swun.bnb.libs.pojo.Book;

public class BookMapper implements RowMapper<Book> {

	@Override
	public Book mapRow(ResultSet rs, int index) throws SQLException {
		Book book = new Book();
		book.setIsbn(rs.getString("isbn"));
		book.setName(rs.getString("name"));
		book.setAuthor(rs.getString("author"));
		book.setPublisher(rs.getString("publisher"));
		book.setTypeId(rs.getInt("type_id"));
		book.setTotalNum(rs.getInt("total_num"));
		book.setAvailableNum(rs.getInt("available_num"));
        book.setPrice(rs.getInt("price"));
        book.setWithPic(rs.getBoolean("with_pic"));
        book.setPicUrl(rs.getString("picurl"));
        return book;
	}


}
