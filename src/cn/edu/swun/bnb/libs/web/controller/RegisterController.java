package cn.edu.swun.bnb.libs.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.edu.swun.bnb.libs.customerexception.CustomerException;
import cn.edu.swun.bnb.libs.pojo.HeadPic;
import cn.edu.swun.bnb.libs.pojo.Ins;
import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.pojo.Major;
import cn.edu.swun.bnb.libs.pojo.Student;
import cn.edu.swun.bnb.libs.service.HeadPicService;
import cn.edu.swun.bnb.libs.service.InsService;
import cn.edu.swun.bnb.libs.service.MajorService;
import cn.edu.swun.bnb.libs.service.StudentService;
import cn.edu.swun.bnb.libs.service.UserService;

@Controller
public class RegisterController {
	@Autowired
	private MajorService majorService;
	@Autowired
	private InsService insService;
	@Autowired
	private UserService userService;
	@Autowired 
	private StudentService studentService;
	@Autowired
	private HeadPicService headpicService;
	Logger log  = LoggerFactory.getLogger(RegisterController.class);
	
	@RequestMapping("/jump-register")
	public String register(HttpServletRequest request) {
		String hint = request.getParameter("hint");
		request.setAttribute("hint", hint);
		List<Ins> inslist = insService.listAllIns();
		List<Major> majorlist = majorService.listAllMajor();
		request.setAttribute("inslist", inslist);
		request.setAttribute("majorlist", majorlist);
		List<HeadPic> headpiclist = headpicService.list();
		request.setAttribute("headlist", headpiclist);
		return "register";
	}
	@RequestMapping("/confirm")
	public String confirm(HttpServletRequest request,RedirectAttributes attr) {
		LibUser user = new LibUser();
		Date date = new Date();
		log.debug(request.getParameter("male"));
		log.debug("dsvdfbfdb");
		user.setEmail(request.getParameter("email"));
		user.setId(request.getParameter("studno"));
		user.setMale(request.getParameter("male"));
		user.setNickname(request.getParameter("username"));
		user.setPassword(request.getParameter("studpw"));
		user.setRegisterTime(date);
		user.setHeadId(0);
		user.setUserType(0);
		user.setEnabled(true);
		log.debug("dfhgfh"+String.valueOf(user.getMale()));
		Student stu = new Student();
		stu.setStudId(request.getParameter("studno"));
		stu.setStudName(request.getParameter("studname"));
		stu.setInsId(Long.valueOf(request.getParameter("studins")));
		stu.setMajorId(Long.valueOf(request.getParameter("studmajor")));
		try {
			userService.confirm(stu, user);
		}catch (CustomerException e){
			attr.addAttribute("hint",e.getLocalizedMessage());
			return "redirect:/jump-register";
		}
	return "me";
	}
}
