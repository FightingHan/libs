package cn.edu.swun.bnb.libs.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.swun.bnb.libs.pojo.Borrow;
import cn.edu.swun.bnb.libs.service.BorrowService;
@Controller
@RequestMapping("admin/borrow")
public class BorrowManagementController {
	
	@Autowired
	BorrowService borrowService;
	
	
	@RequestMapping("/listbro")
	public String list(HttpServletRequest request) {
		List<Borrow>  brolist = borrowService.listbro();
		request.setAttribute("brolist", brolist);
		return "admin/borrow/borrow-mana";
	}

}
