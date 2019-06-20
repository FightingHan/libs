package cn.edu.swun.bnb.libs.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.swun.bnb.libs.consts.SessionConstant;
import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.service.BookService;
import cn.edu.swun.bnb.libs.service.BorrowService;

@Controller
@RequestMapping("user/book")
public class BookController {
	
	@Autowired
	BookService bookService;
	@Autowired
	BorrowService borrowService;
	
	@RequestMapping("/jump-info")
	public String jumpinfo(String isbn,HttpServletRequest request) {
		request.setAttribute("book", bookService.getBook(isbn));
		HttpSession session = request.getSession();
		session.setAttribute("isbn", isbn);
		return "user/book-info";
	}
	@RequestMapping("/borrow")
	public String borrow(String isbn,HttpServletRequest request) {
		HttpSession session = request.getSession();
		LibUser user = (LibUser)session.getAttribute(SessionConstant.USER_IN_SESSION);
		borrowService.borrow(user.getId(),isbn);
		return "redirect:/admin/borrow/listbro";
	}
}
