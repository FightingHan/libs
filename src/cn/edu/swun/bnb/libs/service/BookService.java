package cn.edu.swun.bnb.libs.service;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.Book;

public interface BookService {
	public void test();
	public List<Book> listbook();
	public boolean add(Book book);
	public boolean del(String isbn);
	public Book getBook(String isbn);
	public boolean modify(Book book);


}
