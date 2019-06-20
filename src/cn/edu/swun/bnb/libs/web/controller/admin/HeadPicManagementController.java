package cn.edu.swun.bnb.libs.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.swun.bnb.libs.pojo.HeadPic;
import cn.edu.swun.bnb.libs.service.HeadPicService;

@Controller
@RequestMapping("/admin/headpic")
public class HeadPicManagementController {
	@Autowired
	private HeadPicService headpicService;
	
	@RequestMapping("/list")
	public String headpic(HttpServletRequest request) {
		List<HeadPic> headpiclist = headpicService.list();
		request.setAttribute("headlist", headpiclist);
		return "admin/head/head-mana";
	}
	@RequestMapping("add")
	public String add() {
		return "redirect:/admin/headpic/list";
	}
	

}
