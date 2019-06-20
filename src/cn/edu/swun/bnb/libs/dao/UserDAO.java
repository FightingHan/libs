package cn.edu.swun.bnb.libs.dao;

import java.util.List;

import cn.edu.swun.bnb.libs.pojo.LibUser;
import cn.edu.swun.bnb.libs.pojo.Student;

public interface UserDAO {
	public LibUser loadUser(String userId);
	public List<LibUser> list();
	public LibUser getUser(String userId);
	public boolean enabled(String userId);
	public boolean add(LibUser user);

}
