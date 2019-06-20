package cn.edu.swun.bnb.libs.dao;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.Borrow;

public interface BorrowDAO {
	public List<Borrow> list();
	public boolean add(Borrow borrow);

}
