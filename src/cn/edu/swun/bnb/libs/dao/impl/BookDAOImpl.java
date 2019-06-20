package cn.edu.swun.bnb.libs.dao.impl;

import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import cn.edu.swun.bnb.libs.dao.BookDAO;
import cn.edu.swun.bnb.libs.mapper.BookMapper;
import cn.edu.swun.bnb.libs.pojo.Book;

public class BookDAOImpl implements BookDAO {
	Logger log = LoggerFactory.getLogger(BookDAOImpl.class);
	JdbcTemplate jdbcTemplate;
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public List<Book> list(){
		String sql = "select * from books";
		List<Book> booklist = jdbcTemplate.query(sql,new BookMapper());
		return booklist;	
	}
	public Book loadBook(String isbn) {
		String sql = "select * from books where isbn = ?";
		Book book = new Book();
		try {
		     book = jdbcTemplate.queryForObject(sql,new BookMapper(),isbn);
	    }catch(EmptyResultDataAccessException e) {//处理空结果集的方法，利用try和catch捕捉异常
	    	return null;
	    }
		return book;
	}
	public boolean add(Book book) {
		log.debug(book.getIsbn());
		String sql = "insert into books values(?,?,?,?,?,?,?,?,?,?)";
		if(jdbcTemplate.update(sql, book.getIsbn(),book.getName(),book.getAuthor(),book.getPublisher(),book.getTypeId(),book.getTotalNum(),book.getAvailableNum(),book.getPrice(),book.isWithPic(),book.getPicUrl())==0)
	         return false;
		return true;
	}
	public boolean remove(String isbn) {
		log.debug(isbn);
		String sql = "delete from books where isbn = ?";
		if(jdbcTemplate.update(sql,isbn)==0)
			return false;
		return true;
	}
	public boolean update(Book book) {
		String sql ="update books set name=?,author=?,publisher=?,type_id=?,total_num=?,available_num=?,price=?,with_pic=?,picurl=? where isbn=?";
		if(jdbcTemplate.update(sql,book.getName(),book.getAuthor(),book.getPublisher(),book.getTypeId(),book.getTotalNum(),book.getAvailableNum(),book.getPrice(),book.isWithPic(),book.getPicUrl(),book.getIsbn())==0)
	         return false;
		return true;
	}
}
