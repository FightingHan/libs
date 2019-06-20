package cn.edu.swun.bnb.libs.service.impl;

import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import cn.edu.swun.bnb.libs.dao.BookDAO;
import cn.edu.swun.bnb.libs.dao.BorrowDAO;
import cn.edu.swun.bnb.libs.pojo.Book;
import cn.edu.swun.bnb.libs.pojo.Borrow;
import cn.edu.swun.bnb.libs.service.BorrowService;

public class BorrowServiceImpl implements BorrowService {

	BorrowDAO borrowDao;
	BookDAO bookDao;
	
	public void setBookDao(BookDAO bookDao) {
		this.bookDao = bookDao;
	}
	public void setBorrowDAO(BorrowDAO borrowDao) {
		this.borrowDao = borrowDao;
	}
	public List<Borrow> listbro(){
		List<Borrow> listbro = borrowDao.list();
		Collections.reverse(listbro);
		//用于将加载的借阅日至按照日期倒序排列
		return listbro;
	}
	public boolean borrow(String studId,String isbn) {
		Borrow borrow = new Borrow();
		Calendar c = Calendar.getInstance();
		borrow.setStudId(studId);
		borrow.setISBN(isbn);
		borrow.setFine(0);
		borrow.setBorrowDay(c.getTime());
		borrow.setRenew(false);
		c.add(Calendar.DATE,30);
		borrow.setShouldReturn(c.getTime());
		borrow.setActualReturn(null);
		borrowDao.add(borrow);
		return true;
	}

}
