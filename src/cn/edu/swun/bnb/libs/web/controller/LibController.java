package cn.edu.swun.bnb.libs.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.swun.bnb.libs.pojo.Book;
import cn.edu.swun.bnb.libs.service.BookService;

@Controller
public class LibController {
	
	
	
	@Autowired
	BookService bookService;
	
	@RequestMapping("/listbook")
	public String list(HttpServletRequest request) {
		List<Book> booklist = bookService.listbook();
		request.setAttribute("booklist", booklist);
		return "admin/book/book-mana";
		
	}
	@RequestMapping("/home")
	public String hello(HttpServletRequest request){
		List<Book> booklist = bookService.listbook();
		request.setAttribute("booklist", booklist);
		return "home";
	}

}
