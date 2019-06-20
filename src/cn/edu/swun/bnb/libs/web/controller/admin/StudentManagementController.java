package cn.edu.swun.bnb.libs.web.controller.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.edu.swun.bnb.libs.pojo.Ins;
import cn.edu.swun.bnb.libs.pojo.Major;
import cn.edu.swun.bnb.libs.pojo.Student;
import cn.edu.swun.bnb.libs.service.InsService;
import cn.edu.swun.bnb.libs.service.MajorService;
import cn.edu.swun.bnb.libs.service.StudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/student")
public class StudentManagementController {
	
	private Logger log = LoggerFactory.getLogger(StudentManagementController.class);	
	@Autowired
	private StudentService studentService;
	@Autowired
	private MajorService majorService;
	@Autowired
	private InsService insService;
	
	@RequestMapping("/liststu")
	public String listStudent(HttpServletRequest request,String Name,String Id,String ins) {
		Long Ins;
		if(ins == null || ins.trim().isEmpty())
			Ins = 0L;
		else
			Ins = Long.valueOf(ins);
		log.debug(Ins.toString());
		List<Student> stulist = studentService.liststudent(Name,Id,Ins);	
		request.setAttribute("studentList", stulist);
		List<Ins> inslist = insService.listAllIns();
		request.setAttribute("inslist", inslist);
		return "admin/student/stud-mana";
	}
	@RequestMapping("/batchdel")
	public String batchdelete(HttpServletRequest request) {
		String[] batchdel = request.getParameterValues("batchdel");
		for(int i=0;i<batchdel.length;i++) {
			log.debug("studId==="+batchdel[i]);
			studentService.del(batchdel[i]);
		}
		return "redirect:/admin/student/liststu";
	}
	@RequestMapping("/jump-add")
	public String listins(HttpServletRequest request) {
		String hint = request.getParameter("hint");
		request.setAttribute("hint",hint);
		List<Ins> inslist = insService.listAllIns();
		List<Major> majorlist = majorService.listAllMajor();
		request.setAttribute("inslist", inslist);
		request.setAttribute("majorlist", majorlist);
		return "admin/student/stud-add";
	}
	@RequestMapping("/add")
	public String add(String studId,String studName,HttpServletRequest request,RedirectAttributes attr) {
		Student stud = new Student();
		Long insId = Long.valueOf(request.getParameter("studins"));
		Long majorId = Long.valueOf(request.getParameter("studmajor"));
		stud.setStudName(studName);
		stud.setStudId(studId);
		stud.setInsId(insId);
		stud.setMajorId(majorId);
		if(!studentService.add(stud)) {
			attr.addAttribute("hint", "该学籍信息已被添加过了");
			return "redirect:/admin/student/jump-add";
		}
		else
		    return "redirect:/admin/student/liststu";
	}
	@RequestMapping("/del")
	public String del(String studId) {
		log.debug(studId);
		studentService.del(studId);
		return "redirect:/admin/student/liststu";
	}
	@RequestMapping("/jump")
	public String jump(String jsp) {
		return "admin/student/"+jsp;
	}
	@RequestMapping("/search")
	public String search(String studName,String studId,String studIns) {
		studentService.search(studName, studId, studIns);
		return "admin/student/stud-mana";
	}
	@RequestMapping("/getstu")
	public String search(String studId) {
		return "admin/student/stud-mana";
	}
	@RequestMapping("/jumpmodi")
	public String jumpmodi(String studId,HttpServletRequest request) {
		List<Ins> inslist = insService.listAllIns();
		List<Major> majorlist = majorService.listAllMajor();
		request.setAttribute("majorlist", majorlist);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("admin/student/stud-modi");
		modelAndView.addObject("inslist",inslist);
		request.setAttribute("inslist", inslist);
		Student stud = studentService.getstud(studId);
		request.setAttribute("stud", stud);
		return "admin/student/stud-modi";
	}
	@RequestMapping("modi")
	public String modi(String studId,String studName,HttpServletRequest request) {
		Student stud = new Student();
		Long insId = Long.valueOf(request.getParameter("studins"));
		Long majorId = Long.valueOf(request.getParameter("studmajor"));
		stud.setStudName(studName);
		stud.setStudId(studId);
		stud.setInsId(insId);
		stud.setMajorId(majorId);
		studentService.update(stud);
		return "redirect:/admin/student/liststu";
	}
	@RequestMapping("/findMajor")
	public String findClass(HttpServletRequest request,HttpServletResponse response) throws Exception{
		log.debug("findMajor");
		response.setContentType("text/json; charset=UTF-8");
		Long insid = Long.valueOf(request.getParameter("studins"));
		log.debug(insid.toString());
		PrintWriter out = null;
		try{
			out = response.getWriter();
		}catch(Exception e){
			e.printStackTrace();
		}
		JSONArray array = new JSONArray();
		JSONObject member = null;
		try{
			List<Major> majorlist = majorService.findmajors(insid.intValue());
			for(Major major:majorlist){
				member = new JSONObject();
				member.put("majorId", major.getMajorId());
				member.put("majorName", major.getMajorName());
				array.add(member);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		out.print(array.toString());
		return null;
	}
}
