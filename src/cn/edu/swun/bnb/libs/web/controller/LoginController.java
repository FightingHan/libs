package cn.edu.swun.bnb.libs.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.swun.bnb.libs.consts.SessionConstant;
import cn.edu.swun.bnb.libs.pojo.Book;
import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.service.BookService;
import cn.edu.swun.bnb.libs.service.LoginService;
import cn.edu.swun.bnb.libs.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	BookService bookService;
	@Autowired
	UserService userService;
	Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(HttpServletRequest request,String url){
		String studId = request.getParameter("studno");
		String password = request.getParameter("studpw");
		String urls = request.getHeader("referer");
		String newurl = url.substring(13, url.length()-4);
		log.debug(newurl);
		if(studId == null || studId.trim().isEmpty()) {
			request.setAttribute("error", "请填写用户名");
			return "home";			
		}
		if(password == null || password.trim().isEmpty()) {
			request.setAttribute("error", "请填写密码");
			return "login";
		}
		LibUser user = loginService.login(studId, password);
		HttpSession session = request.getSession();
		session.setAttribute(SessionConstant.USER_IN_SESSION, user);
		if(user == null) {
			request.setAttribute("error", "用户名或密码不正确");
			return "login";
		}
		List<Book> booklist = bookService.listbook();
		request.setAttribute("booklist", booklist);
		return newurl;
	}
	@RequestMapping("/user")
	public String user(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute(SessionConstant.USER_IN_SESSION);
		if(obj == null)
			return "login";
		else
		    return "user";
	}
	@RequestMapping("/admin")
	public String admin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LibUser user = (LibUser)session.getAttribute(SessionConstant.USER_IN_SESSION);
		if(user == null)
			return "login";
		else if(user.getMale().equals("f"))
			return "hint";
		else
		   return "admin";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,String url) {
		HttpSession session = request.getSession();
		session.removeAttribute(SessionConstant.USER_IN_SESSION);
		String newurl = url.substring(13, url.length()-4);
		return newurl;
	}
	@RequestMapping("/me")
	public String me() {
		return "me";
	}
	@ResponseBody
	@RequestMapping(value = "logins")
	public LibUser login(LibUser user) {
		log.debug("name = "+user.getId()+"/ pasxword" +user.getPassword());
        LibUser users = userService.getUser(user.getId());
        return user;
	}
	
}
