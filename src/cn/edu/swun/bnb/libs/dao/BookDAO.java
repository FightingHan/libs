package cn.edu.swun.bnb.libs.dao;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.Book;

public interface BookDAO {
	public List<Book> list();
	public boolean add(Book book);
	public boolean remove(String isbn);
	public Book loadBook(String isbn);
	public boolean update(Book book);
}
