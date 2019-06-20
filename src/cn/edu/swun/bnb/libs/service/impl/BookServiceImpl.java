package cn.edu.swun.bnb.libs.service.impl;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cn.edu.swun.bnb.libs.dao.BookDAO;
import cn.edu.swun.bnb.libs.pojo.Book;
import cn.edu.swun.bnb.libs.service.BookService;

@Service
public class BookServiceImpl implements BookService {
    private Logger log = LoggerFactory.getLogger(BookServiceImpl.class);
	@Override
	public void test() {
		log.debug("test....");
	}
	BookDAO bookDao;
	public void setBookDAO(BookDAO bookDao) {
		this.bookDao = bookDao;
	}
	public List<Book> listbook(){
		return bookDao.list();
	}
	public boolean add(Book book) {
		log.debug("service");
		return bookDao.add(book);
	}
	public boolean del(String isbn) {
		return bookDao.remove(isbn);
	}
	public Book getBook(String isbn) {
		return bookDao.loadBook(isbn);
	}
	public boolean modify(Book book) {
		return bookDao.update(book);
	}

}
