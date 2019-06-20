package cn.edu.swun.bnb.libs.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.swun.bnb.libs.pojo.Book;
import cn.edu.swun.bnb.libs.service.BookService;

@Controller
@RequestMapping("admin/book")
public class BookManagementController {
	@Autowired
	BookService bookService;
	
	@RequestMapping("/listbook")
	public String list(HttpServletRequest request) {
		List<Book> booklist = bookService.listbook();
		request.setAttribute("booklist", booklist);
		return "admin/book/book-mana";
		
	}
	@RequestMapping("/jump-add")
	public String jumpadd() {
		return "admin/book/book-add";
	}
	@RequestMapping("/add")
	public String addbook(String bookName,String bookAuthor,String isbn,String publisher,String bookType,String totalNum,String bookPrice) {
	   Book book = new Book();
	   book.setIsbn(isbn);
	   book.setAuthor(bookAuthor);
	   book.setName(bookName);
	   book.setPublisher(publisher);
	   book.setTypeId(Integer.valueOf(bookType));
	   book.setTotalNum(Integer.valueOf(totalNum));
	   book.setPrice(Integer.valueOf(bookPrice));
	   book.setWithPic(false);
	   book.setAvailableNum(Integer.valueOf(totalNum));
	   book.setPicUrl(null);
	   bookService.add(book);
	   return "redirect:/admin/book/listbook";
	}
	@RequestMapping("/del")
	public String remove(String isbn) {
		bookService.del(isbn);
	   return "redirect:/admin/book/listbook";		
	}
	@RequestMapping("/info")
	public String info(String isbn,HttpServletRequest request) {
		Book book = bookService.getBook(isbn);
		request.setAttribute("book", book);
		return "admin/book/book-info";
	}
	@RequestMapping("/jump-modify")
	public String jumpmodify(HttpServletRequest request,String isbn) {
		Book book = bookService.getBook(isbn);
		request.setAttribute("book", book);
		return "admin/book/book-modi";
	}
	@RequestMapping("/modify")
	public String modify(String bookName,String bookAuthor,String isbn,String publisher,String bookType,String totalNum,String bookPrice) {
		   Book book = new Book();
		   book.setIsbn(isbn);
		   book.setAuthor(bookAuthor);
		   book.setName(bookName);
		   book.setPublisher(publisher);
		   book.setTypeId(Integer.valueOf(bookType));
		   book.setTotalNum(Integer.valueOf(totalNum));
		   book.setPrice(Integer.valueOf(bookPrice));
		   book.setWithPic(false);
		   book.setAvailableNum(Integer.valueOf(totalNum));
		   book.setPicUrl(null);
		   bookService.modify(book);
		   return "redirect:/admin/book/listbook";	   
	}

}
