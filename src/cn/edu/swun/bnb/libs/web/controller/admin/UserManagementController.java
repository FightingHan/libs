package cn.edu.swun.bnb.libs.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
@RequestMapping("admin/user")
public class UserManagementController {
	@Autowired
	private MajorService majorService;
	@Autowired
	private InsService insService;
	@Autowired
	private UserService userService;
	@Autowired 
	private StudentService studentService;
	
	@RequestMapping("/listuser")
	public String list(HttpServletRequest request) {
		List<LibUser> userlist = userService.list();
		request.setAttribute("userlist", userlist );
		return "admin/user/user-mana";
	}
	@RequestMapping("/enabled")
	public String enabled(String userId) {
		userService.enabled(userId);
		return "redirect:/admin/user/listuser";
	}
	@RequestMapping("/jump-info")
	public String info(String userId,HttpServletRequest request) {
		LibUser user = userService.getUser(userId);
		Student stu = studentService.getstud(userId);
		request.setAttribute("user", user);
		request.setAttribute("stu", stu);
		return "admin/user/user-info";
	}
}
