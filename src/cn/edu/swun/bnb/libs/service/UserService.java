package cn.edu.swun.bnb.libs.service;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.pojo.Student;

public interface UserService {
	
	public List<LibUser> list();
    public LibUser getUser(String userId);
    public boolean enabled(String userId);
    public boolean confirm(Student stu,LibUser user);
}
