package cn.edu.swun.bnb.libs.service.impl;

import java.util.List;

import cn.edu.swun.bnb.libs.customerexception.CustomerException;
import cn.edu.swun.bnb.libs.dao.StudentDAO;
import cn.edu.swun.bnb.libs.dao.UserDAO;
import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.pojo.Student;
import cn.edu.swun.bnb.libs.service.UserService;

public class UserServiceImpl implements UserService {
	
	UserDAO userDao;
	StudentDAO studentDao;
	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}
	
	public void setUserDAO(UserDAO userDao) {
		this.userDao = userDao;
	}
	public List<LibUser> list(){
		return userDao.list();
	}
	public LibUser getUser(String userId) {
		return userDao.getUser(userId);
	}
    public boolean enabled(String userId) {
    	return userDao.enabled(userId);
    }
    public boolean confirm(Student stu,LibUser user) {
    	Student stud = studentDao.getstu(stu.getStudId());
    	if(stud == null)
			throw new CustomerException("你的学籍不在库中，请联系管理员添加！");
		if(userDao.getUser(user.getId()) != null)
			throw new CustomerException("你的学号已经被注册过了");
		else {
    	    if(stud.getInsId() == stu.getInsId() && stud.getMajorId() == stu.getMajorId() && stud.getStudName() == stu.getStudName()) {
    		      userDao.add(user);
    	    }
    	    else {
			     throw new CustomerException("你的学籍信息有误，请重新填写！");      		
		    }
    	return true;	
       }
    }
}
