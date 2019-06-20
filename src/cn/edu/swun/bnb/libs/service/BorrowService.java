package cn.edu.swun.bnb.libs.service;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.Borrow;

public interface BorrowService {
	public List<Borrow> listbro();
	public boolean borrow(String studId,String isbn);
	

}
